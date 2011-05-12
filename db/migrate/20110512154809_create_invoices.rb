class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.string  :concept, :null => false
      t.integer :invoice_number, :null => false
      t.integer :amount_before_tax, :null => false, :scale => 2
      t.integer :tax, :null => false
      t.string  :alpha_amount, :null => false
      t.datetime :created_at, :null => false
      t.datetime :cancelled_at
      t.references :student_invoice_data, :null => false
    end
  end

  def self.down
    drop_table :invoices
  end
end
