class BatchesController < ApplicationController
  before_filter :init_data
  filter_access_to :all
  
  def index
    @batches = @course.batches
  end

  def new
    @batch = @course.batches.build
  end

  def create
    @batch = @course.batches.build(params[:batch])
    if @batch.save
      flash[:notice] = t('app.controllers.batches_controller.batch_created_successfully')
      redirect_to [@course, @batch]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @batch.update_attributes(params[:batch])
      flash[:notice] = t('app.controllers.batches_controller.updated_batch_details_successfully')
      redirect_to [@course, @batch]
    else
      flash[:notice] = t('app.controllers.batches_controller.please_fill_all_feilds')
       redirect_to  edit_course_batch_path(@course, @batch)
    end
  end

  def show
    @students = @batch.students
  end

  def destroy
    if @batch.students.empty? and @batch.subjects.empty?
    @batch.inactivate
    flash[:notice] = t('app.controllers.batches_controller.batch_deleted_successfully')
     redirect_to @course
    else
     flash[:warn_notice] = '<p>' + t('app.controllers.batches_controller.unable_to_delete_batch_please_delete_all_students_first') + '</p>' if @batch.students.empty?
     flash[:warn_notice] = '<p>' + t('app.controllers.batches_controller.unable_to_delete_batch_please_delete_all_subjects_first') + '</p>' if @batch.subjects.empty?
   redirect_to [@course, @batch]
    end
  end

  private
  def init_data
    @batch = Batch.find params[:id] if ['show', 'edit', 'update', 'destroy'].include? action_name
    @course = Course.find params[:course_id]
  end
end