class Invoice < ActiveRecord::Base
  has_one :student_invoice_data
end
