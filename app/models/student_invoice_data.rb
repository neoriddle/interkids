class StudentInvoiceData < ActiveRecord::Base
  belongs_to :student
  belongs_to :invoice
end
