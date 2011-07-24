# Header
pdf.header pdf.margin_box.top_left do
  if FileTest.exists?("#{RAILS_ROOT}/public/uploads/image/institute_logo.jpg")
    logo = "#{RAILS_ROOT}/public/uploads/image/institute_logo.jpg"
  else
    logo = "#{RAILS_ROOT}/public/images/application/app_interkids_logo.jpg"
  end

  @institute_name = Configuration.get_config_value('InstitutionName');
  @institute_address = Configuration.get_config_value('InstitutionAddress');

  pdf.image logo, :position=>:left, :height=>50, :width=>50
  pdf.font "Helvetica" do
    info = [[@institute_name],
            [@institute_address]]
    pdf.move_up(50)
    pdf.fill_color "97080e"
    pdf.table info, 
              :width => 400,
              :align => {0 => :center},
              :position => :center,
              :border_color => "FFFFFF"
    pdf.move_down(20)
    pdf.stroke_horizontal_rule
  end
end

pdf.move_down(80)
pdf.text "Fee Reciept" , :size => 14 ,:align => :center
pdf.move_down(20)
pdf.text "Name : #{@student.full_name}" , :size => 11
pdf.text "Admission no : #{@particular.admission_no}" , :size => 11
pdf.text "Payment : #{@collection.name}" , :size => 11
pdf.text "Amount paid : #{@particular.amount * -1}" , :size => 11
pdf.text "Total left : #{@total_left_to_pay}" , :size => 11


pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 25] do
  pdf.font "Helvetica" do
    signature = [[""]]
    pdf.table(signature,
              :width => 500,
              :align => {0 => :right,1 => :right},
              :headers => ["Signature"],
              :header_text_color  => "DDDDDD",
              :border_color => "FFFFFF",
              :position => :center)
    pdf.move_down(20)
    pdf.stroke_horizontal_rule
  end
end

