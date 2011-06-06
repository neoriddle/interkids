# Header
pdf = Prawn::Document.new(:page_size => "A5", :page_layout => :landscape)

pdf.text "#{@invoice.invoice_number}", :at => [445,282]

pdf.text "a", :at => [0,0]

pdf.text "#{Time.new.day}", :at => [314,243]

pdf.text "#{Time.new.month}", :at => [367,243]

pdf.text "#{Time.new.year}", :at => [472,243]

pdf.text "#{@student_invoice_data.student.full_name}", :at => [131,225]

pdf.text "#{@student_invoice_data.street}", :at => [131,208]

pdf.text "#{@student_invoice_data.address}", :at => [131,190]

pdf.text "#{@student_invoice_data.rfc}", :at => [131,173]

pdf.text "#{@student_invoice_data.student.full_name}", :at => [210,158]

pdf.text "#{@fee_category.name}", :at => [210,98]

pdf.text "#{@fee_collection.name}", :at => [210,83]

pdf.text "#{@invoice.alpha_amount}", :at => [65,38]

pdf.text "#{@invoice.amount_before_tax}", :at => [445,100]

pdf.text "#{@invoice.tax}", :at => [445,85]

pdf.text "#{@invoice.amount_after_tax}", :at => [445,70]


