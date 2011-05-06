class ConfigurationController < ApplicationController
  before_filter :login_required
  filter_access_to :all

  FILE_EXTENSIONS = [".jpg",".jpeg",".png"]#,".gif",".png"]
  FILE_MAXIMUM_SIZE_FOR_FILE=1048576

  def settings
    @config = Configuration.get_multiple_configs_as_hash ['InstitutionName', 
                                                          'InstitutionAddress', 
                                                          'InstitutionPhoneNo',
                                                          'StudentAttendanceType', 
                                                          'CurrencyType', 
                                                          'ExamResultType', 
                                                          'AdmissionNumberAutoIncrement',
                                                          'EmployeeNumberAutoIncrement',
                                                          'MaximumCashLimit',
                                                          'MinimumCashLimit']

    if request.post?

      unless params[:upload].nil?
        @temp_file=params[:upload][:datafile]
        unless FILE_EXTENSIONS.include?(File.extname(@temp_file.original_filename).downcase)
          flash[:notice] = t('app.controllers.configuration_controller.invalid_extention_image_must_be_jpg')
          redirect_to :action => "settings"  and return
        end
        if @temp_file.size > FILE_MAXIMUM_SIZE_FOR_FILE
          flash[:notice] = t('app.controllers.configuration_controller.file_too_large_file_size_should_be_less_than_1_mb')
          redirect_to :action => "settings" and return
        end
      end
    
      Configuration.set_config_values(params[:configuration])
      Configuration.save_institution_logo(params[:upload]) unless params[:upload].nil?

      flash[:notice] = t('app.controllers.configuration_controller.settings_has_been_saved')
      redirect_to :action => "settings"  and return
    end
  end
end
