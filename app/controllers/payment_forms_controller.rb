class PaymentFormsController < ApplicationController
  # GET /payment_forms
  # GET /payment_forms.xml
  def index
    @payment_forms = PaymentForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_forms }
    end
  end

  # GET /payment_forms/1
  # GET /payment_forms/1.xml
  def show
    @payment_form = PaymentForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_form }
    end
  end

  # GET /payment_forms/new
  # GET /payment_forms/new.xml
  def new
    @payment_form = PaymentForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_form }
    end
  end

  # GET /payment_forms/1/edit
  def edit
    @payment_form = PaymentForm.find(params[:id])
  end

  # POST /payment_forms
  # POST /payment_forms.xml
  def create
    @payment_form = PaymentForm.new(params[:payment_form])

    respond_to do |format|
      if @payment_form.save
        flash[:notice] = t('app.controllers.payment_forms_controller.paymentform_created')
        format.html { redirect_to(@payment_form) }
        format.xml  { render :xml => @payment_form, :status => :created, :location => @payment_form }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payment_forms/1
  # PUT /payment_forms/1.xml
  def update
    @payment_form = PaymentForm.find(params[:id])

    respond_to do |format|
      if @payment_form.update_attributes(params[:payment_form])
        flash[:notice] = t('app.controllers.payment_forms_controller.paymentform_updeted')
        format.html { redirect_to(@payment_form) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_forms/1
  # DELETE /payment_forms/1.xml
  def destroy
    @payment_form = PaymentForm.find(params[:id])
    @payment_form.destroy

    respond_to do |format|
      format.html { redirect_to(payment_forms_url) }
      format.xml  { head :ok }
    end
  end
end
