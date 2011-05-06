class CashBoxesController < ApplicationController
  # GET /cash_boxes
  # GET /cash_boxes.xml
  def index
    @cash_boxes = CashBox.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cash_boxes }
      format.xls  { send_data @cash_boxes.to_xls }
      format.csv  { send_data @cash_boxes.to_csv ( :except => [:id] ) }
    end
  end

  # GET /cash_boxes/1
  # GET /cash_boxes/1.xml
  def show
    @cash_box = CashBox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cash_box }
    end
  end

  # GET /cash_boxes/new
  # GET /cash_boxes/new.xml
  def new
    @cash_box = CashBox.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cash_box }
    end
  end

  # GET /cash_boxes/1/edit
  def edit
    @cash_box = CashBox.find(params[:id])
  end

  # POST /cash_boxes
  # POST /cash_boxes.xml
  def create
    @cash_box = CashBox.new(params[:cash_box])

    respond_to do |format|
      if @cash_box.save
        format.html { redirect_to(@cash_box, :notice =>  t('app.controllers.cash_boxes_controller.cashbox_created')}
        format.xml  { render :xml => @cash_box, :status => :created, :location => @cash_box }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cash_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cash_boxes/1
  # PUT /cash_boxes/1.xml
  def update
    @cash_box = CashBox.find(params[:id])

    respond_to do |format|
      if @cash_box.update_attributes(params[:cash_box])
        format.html { redirect_to(@cash_box, :notice => t('app.controllers.cash_boxes_controller.cashbox_updated')}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cash_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_boxes/1
  # DELETE /cash_boxes/1.xml
  def destroy
    @cash_box = CashBox.find(params[:id])
    @cash_box.destroy

    respond_to do |format|
      format.html { redirect_to(cash_boxes_url) }
      format.xml  { head :ok }
    end
  end
end
