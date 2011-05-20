class Invoice < ActiveRecord::Base
  has_one :student_invoice_data

  attr_accessor :amount_after_tax

  def amount_after_tax
    amount_before_tax.to_f + tax.to_f
  end

end
