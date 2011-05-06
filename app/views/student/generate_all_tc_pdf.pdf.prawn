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


@students.each do |student|

pdf.move_down(100)
pdf.text t('app.views.student.generate_all_tc_pdf.transfer_certificate') , :size => 12 ,:align=>:center

pdf.move_down(20)
data=Array.new(){Array.new()}

data = [[t('app.views.student.generate_all_tc_pdf.name'),student.full_name],
[t('app.views.student.generate_all_tc_pdf.admission_no'),student.admission_no],
[t('app.views.student.generate_all_tc_pdf.date_of_admission'),student.admission_date.strftime("%d %B %Y")],
[t('app.views.student.generate_all_tc_pdf.dob'),student.date_of_birth.strftime("%d %B %Y")],
[t('app.views.student.generate_all_tc_pdf.last_attended_course'),student.batch.full_name],
[t('app.views.student.generate_all_tc_pdf.blood_group'),student.blood_group],
[t('app.views.student.generate_all_tc_pdf.gender'),student.gender_as_text],
[t('app.views.student.generate_all_tc_pdf.nationality'),student.nationality.name],
[t('app.views.student.generate_all_tc_pdf.language'),student.language]]

if @father
                data.push [t('app.views.student.generate_all_tc_pdf.father'), @father.full_name]
elsif @mother
                data.push [t('app.views.student.generate_all_tc_pdf.mother'), @mother.full_name]
else
    unless @immediate_contact.nil?
                data.push [@immediate_contact.relation, @immediate_contact.full_name ]
   end
end
unless student.student_category.nil?
                data.push [t('app.views.student.generate_all_tc_pdf.category'),student.student_category.name]
end

data.push  [t('app.views.student.generate_all_tc_pdf.religion'),student.religion],
        [t('app.views.student.generate_all_tc_pdf.address'),student.address_line1],
        ["",student.address_line2],
        [t('app.views.student.generate_all_tc_pdf.city'),student.city],
        [t('app.views.student.generate_all_tc_pdf.state'),student.state],
        [t('app.views.student.generate_all_tc_pdf.country'),student.country.name],
       [t('app.views.student.generate_all_tc_pdf.reason_for_leaving'),student.status_description]




pdf.table data, :width => 500,
                :border_color => "000000",
                :header_color => "c3d9ff",
                :header_text_color  => "97080e",
                :position => :center,
                :row_colors => ["FFFFFF","DDDDDD"],
                :align => { 0 => :left, 1 => :left}


pdf.start_new_page


pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 25] do
     pdf.font "Helvetica" do
        signature = [[""]]
        pdf.table signature, :width => 500,
                :align => {0 => :right,1 => :right},
                :headers => [t('app.views.student.generate_all_tc_pdf.signature')],
                :header_text_color  => "DDDDDD",
                :border_color => "FFFFFF",
                :position => :center
        pdf.move_down(20)
        pdf.stroke_horizontal_rule
    end
end
end