class CoursesController < ApplicationController
  before_filter :login_required
  before_filter :find_course, :only => [:show, :edit, :update, :destroy]
  filter_access_to :all
  
  def index
    @courses = Course.active
  end

  def new
    @course = Course.new
  end

  def manage_course
    @courses = Course.active
  end

  def manage_batches

  end

  def update_batch
    @batch = Batch.find_all_by_course_id(params[:course_name], :conditions => { :is_deleted => false, :is_active => true })

    render(:update) do |page|
      page.replace_html 'update_batch', :partial=>'update_batch'
    end

  end

  def create
    @course = Course.new params[:course]
    if @course.save
      flash[:notice] = t('app.controllers.courses_controller.created_course_sucessfully')
      redirect_to :action=>'manage_course'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update_attributes(params[:course])
      flash[:notice] = t('app.controllers.courses_controller.updated_course_details_successfully')
      redirect_to :action=>'manage_course'
    else
      render 'edit'
    end
  end

  def destroy
    if @course.batches.active.empty?
      @course.inactivate
       flash[:notice]= t('app.controllers.courses_controller.course_deleted_successfully')
      redirect_to :action=>'manage_course'
    else
      flash[:warn_notice]="<p>" + t('app.controllers.courses_controller.unable_to_delete_please_remove_exising_batches_and_students') + "</p>"
      redirect_to :action=>'manage_course'
    end
  
  end

  def show
    @batches = @course.batches.active
  end

  private
  def find_course
    @course = Course.find params[:id]
  end


  #  To be used once the new exam system is completed.
  #
  #  def email
  #    @course = Course.find(params[:id])
  #    if request.post?
  #      recipient_list = []
  #      case params['email']['recipients']
  #      when 'Students'             then recipient_list << @course.student_email_list
  #      when 'Guardians'            then recipient_list << @course.guardian_email_list
  #      when 'Students & Guardians' then recipient_list += @course.student_email_list + @course.guardian_email_list
  #      end
  #
  #      unless recipient_list.empty?
  #        recipients = recipient_list.join(', ')
  #        FedenaMailer::deliver_email(recipients, params[:email][:subject], params[:email][:message])
  #        flash[:notice] = t('app.controllers.courses_controller.mail_sent_to') #{recipients}"
  #        redirect_to :controller => 'user', :action => 'dashboard'
  #      end
  #    end
  #  end
  #
  #  def send_sms
  #    @course = Course.find params[:id], :include => [:students]
  #    if request.post?
  #      sms = SmsManager.new params[:message], ['9656001824']
  #      sms.send_sms
  #      flash[:notice] = t('app.controllers.courses_controller.text_messages_sent_successfully')
  #    end
  #  end

end