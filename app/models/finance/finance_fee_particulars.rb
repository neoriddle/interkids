class FinanceFeeParticulars < ActiveRecord::Base

  belongs_to :fee_category ,:class_name => "FinanceFeeCategory"
  belongs_to :student_category
  belongs_to :fee_collection, 
             :class_name => "FinanceFeeCollection", 
             :foreign_key => 'id'
  validates_presence_of :name,:amount
  validates_numericality_of :amount
  cattr_reader :per_page
  @@per_page = 10

  def self.fees(fee_collection, fee_category, student)
    find(:all, 
         :conditions => ["(is_deleted = ? "\
                         "AND "\
                         "(student_category_id IS NULL AND admission_no IS NULL) " \
                         "OR "\
                         "(student_category_id = ? AND admission_no IS NULL) " \
                         "OR "\
                         "(student_category_id IS NULL AND admission_no = ?) " \
                         ") "\
                         "AND "\
                         "(finance_fee_category_id = ?) " \
                         "AND "\
                         "(finance_fee_collection_id IS NULL OR finance_fee_collection_id = ?) ", 
                         false,                            # is_deleted
                         student.student_category_id,      # student_category_id
                         student.admission_no,             # admission_no
                         fee_category.id,                  # fee_category_id
                         fee_collection.id                 # fee_collection_id
                        ])
  end

  def can_print_receipt?
    self.amount < 0 && self.name == 'Abono'
  end

end
