pdf = Prawn::Document.new(:page_size => [596,385], :page_layout => :portrait)

pdf.text "#{Time.new.day}", :at => [305,230]

pdf.text "#{Time.new.month}", :at => [367,230]

pdf.text "#{Time.new.year}", :at => [465,230]

pdf.text "#{@student_invoice_data.name}", :at => [105,209]

pdf.text "#{@student_invoice_data.street}", :at => [105,192]

pdf.text "#{@student_invoice_data.address}", :at => [105,174]

pdf.text "#{@student_invoice_data.rfc}", :at => [105,156]

pdf.text "#{@student_invoice_data.student.full_name}", :at => [210,138]

pdf.text "#{@fee_category.name}", :at => [190,70]

pdf.text "#{@fee_collection.name}", :at => [190,52]

pdf.text "#{@invoice.amount_before_tax}", :at => [445,73]

pdf.text "#{@invoice.tax}", :at => [445,51]

pdf.text "#{@invoice.amount_after_tax}", :at => [440,29]

  
pdf.bounding_box([290,25], :width => 200, :height => 100) do
pdf.text "#{@invoice.alpha_amount}"
end