class FinanceTransaction < ActiveRecord::Base
  belongs_to :category, 
             :class_name => 'FinanceTransactionCategory', 
             :foreign_key => 'category_id'
  belongs_to :student
  belongs_to :payment_form,
             :class_name => 'PaymentForm', 
             :foreign_key => 'payment_form_id'
  has_many :finance_fees, 
           :class_name => 'FinanceFee',
           :foreign_key => 'id'

  cattr_reader :per_page

  # Validators
  validates_presence_of :title,:amount, :payment_form
  validates_numericality_of :amount, :greater_than => 0

  def self.report(start_date,end_date,page)
    paginate :per_page =>5 ,:page => page,
      :conditions => ["created_at >= '#{start_date}' and created_at <= '#{end_date}'and category_id !='#{3}' and category_id !='#{2}'and category_id !='#{1}'"],
      :order => 'created_at'
  end

  def self.grand_total(start_date,end_date)

    other_transactions = FinanceTransaction.find(:all ,
      :conditions => ["created_at >= '#{start_date}' and created_at <= '#{end_date}'and category_id !='#{3}' and category_id !='#{2}'and category_id !='#{1}'"])
    transactions_fees = FinanceTransaction.find(:all,
      :conditions => ["created_at >= '#{start_date}' and created_at <= '#{end_date}'and category_id ='#{3}'"])
    employees = Employee.find(:all)
    donations = FinanceTransaction.find(:all,
      :conditions => ["created_at >= '#{start_date}' and created_at <= '#{end_date}'and category_id ='#{2}'"])
    trigger = FinanceTransactionTrigger.find(:all)
    hr = Configuration.find_by_config_value("HR")
    income_total = 0
    expenses_total = 0
    fees_total =0
    salary = 0

    unless hr.nil?
    salary = Employee.total_employees_salary(employees, start_date, end_date)
    expenses_total += salary
    end
    donations.each do |d|
      if d.category.is_income?
        income_total +=d.amount
      else
        expenses_total +=d.amount
      end
      trigger.each do |trgr|
        expenses_total += (d.amount * (trgr.percentage / 100)) if d.category_id == trgr.finance_category.id unless trgr.finance_category.id.nil?
      end
    end
    transactions_fees.each do |fees|
      income_total +=fees.amount
      fees_total += fees.amount
    end
    
    other_transactions.each do |t|
      if t.category.is_income?
        income_total +=t.amount
      else
        expenses_total +=t.amount
      end
    end
    income_total-expenses_total
    
  end

  def self.total_fees(start_date,end_date)
    fees = 0
    transactions_fees = FinanceTransaction.find(:all,
      :conditions => ["created_at >= '#{start_date}' and created_at <= '#{end_date}'and category_id ='#{3}'"])
    transactions_fees.each do |f|
      fees += f.amount
    end
    fees
  end

  def self.donations_triggers(start_date,end_date)
    donations_income =0
    donations_expenses =0
    donations = FinanceTransaction.find(:all,:conditions => ["created_at >= '#{start_date}' and created_at <= '#{end_date}'and category_id ='#{2}'"])
    trigger = FinanceTransactionTrigger.find(:all)
    donations.each do |d| 
      if d.category.is_income?
        donations_income+=d.amount
      else
        donations_expenses+=d.amount
      end
      trigger.each do |t|   
        unless t.finance_category.id.nil? 
          if d.category_id == t.finance_category.id
            donations_expenses += (d.amount * (t.percentage / 100))
          end
        end
      end
    end
    donations_income-donations_expenses
    
  end


# SELECT 
#     ffca.name, 
#     ffc.name, 
#     ft.title, 
#     CONCAT(s.first_name, ' ', s.last_name), 
#     pf.name, 
#     ft.amount, 
#     date_format(ft.created_at,'%d/%m/%y') 
# FROM 
#     finance_transactions ft 
#     INNER JOIN students s ON ft.student_id = s.id
#     INNER JOIN payment_forms pf ON ft.payment_form_id = pf.id 
#     INNER JOIN finance_fees ff ON ft.finance_fees_id = ff.id 
#     INNER JOIN finance_fee_collections ffc ON ff.fee_collection_id = ffc.id 
#     INNER JOIN finance_fee_categories ffca ON ffc.fee_category_id = ffca.id


end
