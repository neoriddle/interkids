class Invoice < ActiveRecord::Base
  has_one :student_invoice_data

  attr_accessor :amount_after_tax

  before_validation :update_alpha_amount

  def amount_after_tax
    amount_before_tax.to_f + tax.to_f
  end

  def update_alpha_amount
    unless self.amount_after_tax.nil?
      self.alpha_amount = self.amount_after_tax.to_words + ' 00/100 M.N.'
    end
  end
end
