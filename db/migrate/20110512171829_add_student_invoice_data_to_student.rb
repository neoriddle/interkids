class AddStudentInvoiceDataToStudent < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.references :student_invoice_data
    end
  end

  def self.down
    change_table :students do |t|
      t.remove :student_invoice_data
    end
  end
end
