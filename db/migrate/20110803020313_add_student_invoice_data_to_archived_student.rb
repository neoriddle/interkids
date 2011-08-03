class AddStudentInvoiceDataToArchivedStudent < ActiveRecord::Migration
  def self.up
    change_table :archived_students do |t|
      t.references :student_invoice_data
    end
  end

  def self.down
    change_table :archived_students do |t|
      t.remove_references :student_invoice_data
    end
  end
end
