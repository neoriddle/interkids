logo = FileTest.exists?("#{RAILS_ROOT}/public/uploads/image/institute_logo.jpg") ?
"#{RAILS_ROOT}/public/uploads/image/institute_logo.jpg" :
  "#{RAILS_ROOT}/public/images/application/app_interkids_logo.jpg"
institute_name = Configuration.get_config_value('InstitutionName');
institute_address = Configuration.get_config_value('InstitutionAddress');


#
# Report Header
#
pdf.header pdf.margin_box.top_left do
  pdf.image logo,
            :position => :left,
            :height => 50,
            :width=>50
  pdf.font "Helvetica" do
    info = [[institute_name],
            [institute_address]]
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


#
# Report Body
#
pdf.move_down(80)
pdf.text 'Income report', :size => 14 ,:align => :center

pdf.move_down(20)
pdf.text "Title #{@transaction.title} " , :size => 11
pdf.text "Description #{@transaction.description} " , :size => 11
pdf.text "Amount  #{@transaction.amount} " , :size => 11
pdf.text "Created #{@transaction.created_at} " , :size => 11
pdf.text "Category #{@transaction.category.name} " , :size => 11 unless @transaction.category.nil?
pdf.text "Student #{@transaction.student.full_name} " , :size => 11 unless @transaction.student.nil?
pdf.text "Payment form #{@transaction.payment_form.name} " , :size => 11 unless @transaction.payment_form.nil?



#
# Report Footer
#
pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 25] do
  pdf.font "Helvetica" do
    signature = [[""]]
    pdf.table signature,
              :width => 500,
              :align => {0 => :right,1 => :right},
              :headers => [t('app.views.finance.student_fee_receipt_pdf.signature')],
              :header_text_color  => "DDDDDD",
              :border_color => "FFFFFF",
              :position => :center
    pdf.move_down(20)
    pdf.stroke_horizontal_rule
  end
end
