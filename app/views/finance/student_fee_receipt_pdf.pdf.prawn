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

pdf.move_down(80)
pdf.text t('app.views.finance.student_fee_receipt_pdf.fee_reciept') , :size => 14 ,:align => :center
pdf.move_down(20)
pdf.text t('app.views.finance.student_fee_receipt_pdf.name') + "#{@student.full_name} " , :size => 11
pdf.text t('app.views.finance.student_fee_receipt_pdf.admission_no') + "#{@student.admission_no}" , :size => 11

total_fees = 0

data = Array.new(){Array.new()}
@fee_particulars.each_with_index do |fee,i|
      data.push  [ i+1, shorten_string(fee.name,20), @currency_type.to_s+fee.amount.to_s  ]
       total_fees += fee.amount
end

            
unless @financefee.transaction_id.nil?
@trans = FinanceTransaction.find(@financefee.transaction_id)
    if @trans.fine_included
                 data.push [ @fee_particulars.size+1, t('app.views.finance.student_fee_receipt_pdf.fine'), @currency_type.to_s+(@trans.amount.to_f-total_fees).to_s  ]
  total_fees = @trans.amount.to_f
    end
end
pdf.move_down(20)
data.push [ t('app.views.finance.student_fee_receipt_pdf.total'), '', @currency_type.to_s+total_fees.to_s ]
pdf.table data, :width => 500,
                :headers => [ t('app.views.finance.student_fee_receipt_pdf.sl_no'), t('app.views.finance.student_fee_receipt_pdf.particulars'), t('app.views.finance.student_fee_receipt_pdf.amount')  ],
                :border_color => "000000",
                :header_color => "eeeeee",
                :header_text_color  => "97080e",
                :position => :center,
                :row_colors => ["FFFFFF","DDDDDD"],
                :align => { 0 => :left, 1 => :left}


pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 25] do
     pdf.font "Helvetica" do
        signature = [[""]]
        pdf.table signature, :width => 500,
                :align => {0 => :right,1 => :right},
                :headers => [t('app.views.finance.student_fee_receipt_pdf.signature')],
                :header_text_color  => "DDDDDD",
                :border_color => "FFFFFF",
                :position => :center
        pdf.move_down(20)
        pdf.stroke_horizontal_rule
    end
end

