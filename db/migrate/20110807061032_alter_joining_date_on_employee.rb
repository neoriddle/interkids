class AlterJoiningDateOnEmployee < ActiveRecord::Migration
  def self.up
    change_column(:employees, :joining_date, :date, :null => false)
  end

  def self.down
    change_column(:employees, :joining_date, :date, :null => true)
  end
end
