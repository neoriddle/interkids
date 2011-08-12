class AddFeeCategoriesAndFeeCollectionToInvoices < ActiveRecord::Migration
  def self.up
    change_table :invoices do |t|
      t.references :fee_collection
      t.references :fee_category
    end
  end

  def self.down
    change_table :invoices do |t|
      t.remove_references :fee_collection
      t.remove_references :fee_category
    end
  end
end
