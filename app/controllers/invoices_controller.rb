class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.xml
  def index
    @invoices = Invoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new
    @invoice = Invoice.new

    # Getting student invoice data
    if params[:student_invoice_data_id]
      @student_invoice_data = StudentInvoiceData.find(params[:student_invoice_data_id])
      @student = @student_invoice_data.student
    elsif params[:student_id]
      @student = Student.find(params[:student_id])
      @student_invoice_data = @student.student_invoice_data
    end
    @invoice.student_invoice_data_id = @student_invoice_data.id

    @fee_category = FinanceFeeCategory.find(params[:category_id])
    logger.warn "Fee category not found with id => #{params[:category_id]}" if @fee_category.nil?
    @fee_collection = FinanceFeeCollection.find(params[:collection_id])
    logger.warn "Fee collection not found with id => #{params[:collection_id]}" if @fee_collection.nil?
    @invoice.fee_category = @fee_category
    @invoice.fee_collection = @fee_collection
    
    @invoice.concept = "#{@fee_category.name} #{@fee_collection.name}"

    # Load particulars
    particulars = FinanceFeeParticulars.all(:conditions => ['finance_fee_collection_id = ? AND finance_fee_category_id = ?', @fee_collection.id, @fee_category.id])
    logger.debug "Found #{particulars} with {collection_id => #{@fee_collection.id}, category_id => #{@fee_category.id}}"

    # Compute invoice amount
    @invoice.amount_before_tax = 0.0
    particulars.each { |p| @invoice.amount_before_tax += p.amount }
    @invoice.amount_before_tax *= -1

    # Compute tax
    tax_percent = Configuration.find_by_config_key("Tax").config_value.to_f
    @invoice.tax = @invoice.amount_before_tax * tax_percent / 100

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    @invoice = Invoice.new(params[:invoice])
    @fee_category = FinanceFeeCategory.find(params[:fee_category][:id])
    @fee_collection = FinanceFeeCollection.find(params[:fee_collection][:id])

    logger.debug "Print requested with {:invoice => #{@invoice.inspect}, :fee_collection => #{@fee_category.inspect}, :fee_category => #{@fee_collection.inspect}}"

    if @invoice.save
      print_invoice(@invoice, @fee_category, @fee_collection)
    else
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end

  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to(@invoice, :notice => 'Invoice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to(invoices_url) }
      format.xml  { head :ok }
    end
  end

  private
  def print_invoice(invoice, fee_category, fee_collection)
    @invoice, @fee_category, @fee_collection = invoice, fee_category, fee_collection
    logger.debug "Print requested with {:invoice => #{@invoice.inspect}, :fee_collection => #{@fee_category.inspect}, :fee_category => #{@fee_collection.inspect}}"

    @student_invoice_data = StudentInvoiceData.find(@invoice.student_invoice_data_id)
    logger.warn "Student invoice data found with id => #{@invoice.student_invoice_data_id}"

    respond_to do |format|
      format.pdf { render :print_invoice, :layout => false }
    end
  end
end
