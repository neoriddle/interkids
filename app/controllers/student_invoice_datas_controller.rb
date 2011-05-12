class StudentInvoiceDatasController < ApplicationController
  # GET /student_invoice_datas
  # GET /student_invoice_datas.xml
  def index
    @student_invoice_datas = StudentInvoiceData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_invoice_datas }
    end
  end

  # GET /student_invoice_datas/1
  # GET /student_invoice_datas/1.xml
  def show
    @student_invoice_data = StudentInvoiceData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_invoice_data }
    end
  end

  # GET /student_invoice_datas/new
  # GET /student_invoice_datas/new.xml
  def new
    @student_invoice_data = StudentInvoiceData.new
    @students = Student.all(:conditions => {:student_invoice_data_id => nil})

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_invoice_data }
    end
  end

  # GET /student_invoice_datas/1/edit
  def edit
    @student_invoice_data = StudentInvoiceData.find(params[:id])
    @students = Student.all(:conditions => {:student_invoice_data_id => nil})
  end

  # POST /student_invoice_datas
  # POST /student_invoice_datas.xml
  def create
    @student_invoice_data = StudentInvoiceData.new(params[:student_invoice_data])
    @students = Student.all(:conditions => {:student_invoice_data_id => nil})

    respond_to do |format|
      if @student_invoice_data.save
        format.html { redirect_to(@student_invoice_data, :notice => 'StudentInvoiceData was successfully created.') }
        format.xml  { render :xml => @student_invoice_data, :status => :created, :location => @student_invoice_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_invoice_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_invoice_datas/1
  # PUT /student_invoice_datas/1.xml
  def update
    @student_invoice_data = StudentInvoiceData.find(params[:id])
    @students = Student.all(:conditions => {:student_invoice_data_id => nil})

    respond_to do |format|
      if @student_invoice_data.update_attributes(params[:student_invoice_data])
        format.html { redirect_to(@student_invoice_data, :notice => 'StudentInvoiceData was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_invoice_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_invoice_datas/1
  # DELETE /student_invoice_datas/1.xml
  def destroy
    @student_invoice_data = StudentInvoiceData.find(params[:id])
    @student_invoice_data.destroy

    respond_to do |format|
      format.html { redirect_to(student_invoice_datas_url) }
      format.xml  { head :ok }
    end
  end
end
