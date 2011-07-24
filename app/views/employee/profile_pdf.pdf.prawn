pdf.header pdf.margin_box.top_left do
if FileTest.exists?("#{RAILS_ROOT}/public/uploads/image/institute_logo.jpg")
logo = "#{RAILS_ROOT}/public/uploads/image/institute_logo.jpg"
else
logo = "#{RAILS_ROOT}/public/images/application/app_interkids_logo.jpg"
end
@institute_name=Configuration.get_config_value('InstitutionName');
@institute_address=Configuration.get_config_value('InstitutionAddress');
pdf.image logo, :position=>:left, :height=>50, :width=>50
pdf.font "Helvetica" do
      info = [[@institute_name],
        [@institute_address]]
pdf.move_up(50)
pdf.fill_color "97080e"
pdf.table info, :width => 400,
                :align => {0 => :center},
                :position => :center,
                :border_color => "FFFFFF"
      pdf.move_down(20)
      pdf.stroke_horizontal_rule
        end
end

pdf.move_down(100)
pdf.text @employee.full_name , :size => 18 ,:at=>[75,620]
pdf.text t('app.views.employee.profile_pdf.employee_profile'),:size => 7,:at=>[75,610]
pdf.move_down(20)

data= [ [t('app.views.employee.profile_pdf.general_profile'), ""],
        [t('app.views.employee.profile_pdf.employee_no'), @employee.employee_number],
        [t('app.views.employee.profile_pdf.doj'), @employee.joining_date.strftime("%d %b, %Y")],
        [t('app.views.employee.profile_pdf.department'), @employee.employee_department.name],
        [t('app.views.employee.profile_pdf.category'), @employee.employee_category.name],
        [t('app.views.employee.profile_pdf.position'), @employee.employee_position.name],
        [t('app.views.employee.profile_pdf.job_title'), @employee.job_title],
        [t('app.views.employee.profile_pdf.manager'), @reporting_manager],
        [t('app.views.employee.profile_pdf.gender'), @gender],
        [t('app.views.employee.profile_pdf.status'), @status],
        [t('app.views.employee.profile_pdf.qualification'), @employee.qualification],
        [t('app.views.employee.profile_pdf.total_experience'), @total_years.to_s + t('app.views.employee.profile_pdf.years') + @total_months.to_s + t('app.views.employee.profile_pdf.months')],
        [t('app.views.employee.profile_pdf.experience_info'), @employee.experience_detail] ]

pdf.table data, :width => 500,
                :border_color => "000000",
                :border_width   => 1,
                :position => :center,
                :row_colors => ["FFFFFF","DDDDDD"],
                :column_widths =>{ 0 => 200, 1 => 200},
                :align => { 0 => :left, 1 => :left}


    pdf.start_new_page
    pdf.move_down(100)
    pdf.text @employee.full_name , :size => 18 ,:at=>[75,620]
    pdf.text t('app.views.employee.profile_pdf.employee_profile_personal'),:size => 7,:at=>[75,610]
    pdf.move_down(20)
data = [[t('app.views.employee.profile_pdf.date_of_birth'), @employee.date_of_birth],
        [t('app.views.employee.profile_pdf.marital_status'), @employee.marital_status],
        [t('app.views.employee.profile_pdf.no_of_children'), @employee.children_count],
        [t('app.views.employee.profile_pdf.fathers_name'), @employee.father_name],
        [t('app.views.employee.profile_pdf.mothers_name'), @employee.mother_name],
        [t('app.views.employee.profile_pdf.spouse_name'), @employee.husband_name],
        [t('app.views.employee.profile_pdf.blood_group'), @employee.blood_group],
        [t('app.views.employee.profile_pdf.nationality'), @employee.nationality.name]]

pdf.table data, :width => 500,
                :border_color => "000000",
                :border_width   => 1,
                :position => :center,
                :row_colors => ["FFFFFF","DDDDDD"],
                :column_widths =>{ 0 => 200, 1 => 200},
                :align => { 0 => :left, 1 => :left}

    pdf.start_new_page
    pdf.move_down(100)
    pdf.text @employee.full_name , :size => 18 ,:at=>[75,620]
    pdf.text t('app.views.employee.profile_pdf.employee_profile_address_details'),:size => 7,:at=>[75,610]
    pdf.move_down(20)

data = [[t('app.views.employee.profile_pdf.home_address'), @employee.home_address_line1],
        ["",@employee.home_address_line2],
        [t('app.views.employee.profile_pdf.city'), @employee.home_city],
        [t('app.views.employee.profile_pdf.state'), @employee.home_state],
        [t('app.views.employee.profile_pdf.country'), @home_country],
        [t('app.views.employee.profile_pdf.pin_code'), @employee.home_pin_code],
        [t('app.views.employee.profile_pdf.office_address'), @employee.office_address_line1],
        ["",@employee.office_address_line2],
        [t('app.views.employee.profile_pdf.city'), @employee.office_city],
        [t('app.views.employee.profile_pdf.state'), @employee.office_state],
        [t('app.views.employee.profile_pdf.country'), @office_country],
        [t('app.views.employee.profile_pdf.pin_code'), @employee.office_pin_code]]
  pdf.table data, :width => 500,
                :border_color => "000000",
                :border_width   => 1,
                :position => :center,
                :row_colors => ["FFFFFF","DDDDDD"],
                :column_widths =>{ 0 => 200, 1 => 200},
                :align => { 0 => :left, 1 => :left}

pdf.start_new_page
pdf.move_down(100)
pdf.text @employee.full_name , :size => 18 ,:at=>[75,620]
pdf.text t('app.views.employee.profile_pdf.employee_profile_contact_details'),:size => 7,:at=>[75,610]
pdf.move_down(20)
data=[[t('app.views.employee.profile_pdf.office_phone1'), @employee.office_phone1],
      [t('app.views.employee.profile_pdf.office_phone2'), @employee.office_phone2],
      [t('app.views.employee.profile_pdf.mobile_phone'), @employee.mobile_phone],
      [t('app.views.employee.profile_pdf.home_phone'), @employee.home_phone],
      [t('app.views.employee.profile_pdf.email'), @employee.email],
      [t('app.views.employee.profile_pdf.fax'), @employee.fax] ]

pdf.table data, :width => 500,
                :border_color => "000000",
                :border_width   => 1,
                :position => :center,
                :row_colors => ["FFFFFF","DDDDDD"],
                :column_widths =>{ 0 => 200, 1 => 200},
                :align => { 0 => :left, 1 => :left}

unless @bank_details.empty?
pdf.start_new_page
pdf.move_down(100)
pdf.text @employee.full_name , :size => 18 ,:at=>[75,620]
pdf.text t('app.views.employee.profile_pdf.employee_profile_bank_account_details'),:size => 7,:at=>[75,610]
pdf.move_down(20)


bank_data = Array.new{Array.new}
@bank_details.each do |b|
  bank_data.push  [[b.bank_field.name],[ b.bank_info]]
end
pdf.table bank_data,:width => 500,
                    :border_color => "000000",
                    :border_width   => 1,
                    :position => :center,
                    :row_colors => ["FFFFFF","DDDDDD"],
                    :column_widths =>{ 0 => 200, 1 => 200},
                    :align => { 0 => :left, 1 => :left}
end

unless @additional_details.empty?
pdf.start_new_page
pdf.move_down(100)
pdf.text @employee.full_name , :size => 18 ,:at=>[75,620]
pdf.text t('app.views.employee.profile_pdf.employee_profile_additional_details'),:size => 7,:at=>[75,610]
pdf.move_down(20)


other_data = Array.new{Array.new}
@additional_details.each do |add_det|
  other_data.push  [[add_det.additional_field.name],[ add_det.additional_info]]
end
pdf.table other_data,:width => 500,
                    :border_color => "000000",
                    :border_width   => 1,
                    :position => :center,
                    :row_colors => ["FFFFFF","DDDDDD"],
                    :column_widths =>{ 0 => 200, 1 => 200},
                    :align => { 0 => :left, 1 => :left}
end


pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 25] do
     pdf.font "Helvetica" do
        signature = [[""]]
        pdf.table signature, :width => 500,
                :align => {0 => :right,1 => :right},
                :headers => [t('app.views.employee.profile_pdf.signature')],
                :header_text_color  => "DDDDDD",
                :border_color => "FFFFFF",
                :position => :center
        pdf.move_down(20)
        pdf.stroke_horizontal_rule
    end
end
