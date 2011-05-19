class StudentInvoiceData < ActiveRecord::Base
  belongs_to :student
  belongs_to :invoice

  validates_presence_of :name, :street, :address, :rfc, :student_id

  attr_accessor :batch_id

end
