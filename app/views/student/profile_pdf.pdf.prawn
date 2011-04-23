pdf.header pdf.margin_box.top_left do
if FileTest.exists?("#{RAILS_ROOT}/public/uploads/image/institute_logo.jpg")
logo = "#{RAILS_ROOT}/public/uploads/image/institute_logo.jpg"
else
logo = "#{RAILS_ROOT}/public/images/application/app_fedena_logo.jpg"
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
pdf.text @student.full_name , :size => 18 ,:at=>[75,620]
pdf.text t('app.views.student.profile_pdf.student_profile') ,:size => 7,:at=>[75,610]



unless @student.student_category.nil?
    cat=@student.student_category.name
else
    cat = " "
end

pdf.move_down(20)

data = []

[
 [t('app.views.student.profile_pdf.admission_number'), @student.admission_no],
 [t('app.views.student.profile_pdf.batch'), @student.batch.full_name ],
 [t('app.views.student.profile_pdf.course'),(@student.batch.course).course_name],
 [t('app.views.student.profile_pdf.date_birth'),@student.date_of_birth.strftime("%d %b, %Y")],
 [t('app.views.student.profile_pdf.blood_group'), @student.blood_group],
 [t('app.views.student.profile_pdf.gender'),@student.gender_as_text],
 [t('app.views.student.profile_pdf.category'),cat],
].each { |d| data << d if d.last }

if @immediate_contact
  [
   #[t('app.views.student.profile_pdf.address'),@immediate_contact.address],
   [t('app.views.student.profile_pdf.city'), @immediate_contact.city],
   [t('app.views.student.profile_pdf.state'),@immediate_contact.state],
   [t('app.views.student.profile_pdf.country'),@immediate_contact.country.name],
   [t('app.views.student.profile_pdf.phone'),@immediate_contact.office_phone1],
   [t('app.views.student.profile_pdf.mobile'),@immediate_contact.office_phone2],
   [t('app.views.student.profile_pdf.email'),@immediate_contact.email]
  ].each { |d| data << d if d.last  }
end

unless @immediate_contact.nil?
  data.push [t('app.views.student.profile_pdf.emergencies'), 
             @immediate_contact.first_name+" "+@immediate_contact.last_name+
             (@immediate_contact.mobile_phone.nil? ? '' : "("+@immediate_contact.mobile_phone+")")]
end

            

unless @additional_fields.nil?
@additional_fields.each do |field|
    detail = StudentAdditionalDetails.find_by_additional_field_id_and_student_id(field.id,@student.id)
   unless detail.nil?
     data.push [field.name,detail.additional_info]
   else
         data.push [field.name," "]
   end
end
end


pdf.table data, :width => 500,
                :border_color => "000000",
                :position => :center,
                :row_colors => ["FFFFFF","DDDDDD"],
                :column_widths =>{ 0 => 200, 1 => 200},
                :align => { 0 => :left, 1 => :left}


pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 25] do
     pdf.font "Helvetica" do
        signature = [[""]]
        pdf.table signature, :width => 500,
                :align => {0 => :right,1 => :right},
                :headers => [t('app.views.student.profile_pdf.signature')],
                :header_text_color  => "DDDDDD",
                :border_color => "FFFFFF",
                :position => :center
        pdf.move_down(20)
        pdf.stroke_horizontal_rule
    end
end
