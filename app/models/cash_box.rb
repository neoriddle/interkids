class CashBox < ActiveRecord::Base
  belongs_to :employee
  has_many :transaction_categories,
           :class_name => 'FinanceTransactionCategory'
end
