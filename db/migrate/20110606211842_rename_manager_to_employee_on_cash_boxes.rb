class RenameManagerToEmployeeOnCashBoxes < ActiveRecord::Migration
  def self.up
    change_table :cash_boxes do |t|
      t.rename :manager, :employee_id
    end
  end

  def self.down
    change_table :cash_boxes do |t|
      t.rename :employee_id, :manager
    end
  end
end
