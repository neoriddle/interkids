class CreateStudentInvoiceDatas < ActiveRecord::Migration
  def self.up
    create_table :student_invoice_datas do |t|
      t.string  :name
      t.string  :street
      t.string  :address
      t.string  :rfc, :limit => 13
      t.integer :student_id
    end
  end

  def self.down
    drop_table :student_invoice_datas
  end
end
