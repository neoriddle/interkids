class Student < ActiveRecord::Base
  belongs_to :country
  belongs_to :batch
  belongs_to :student_category
  belongs_to :nationality, :class_name => 'Country'
  has_one    :immediate_contact
  has_one    :student_previous_data
  has_many   :student_previous_subject_mark
  has_many   :guardians, :foreign_key => 'ward_id', :dependent => :destroy
  has_many   :finance_transactions
  has_many   :fee_category ,:class_name => "FinanceFeeCategory"
  has_one    :student_invoice_data

  has_and_belongs_to_many :graduated_batches, :class_name => 'Batch', :join_table => 'batch_students'

  named_scope :active, :conditions => { :is_active => true }

  validates_presence_of :admission_no, :admission_date, :first_name, :batch_id, :date_of_birth
  validates_uniqueness_of :admission_no
  validates_presence_of :gender

  after_save :create_user_account

  def validate
    errors.add(:date_of_birth, "can't be a future date.") if self.date_of_birth >= Date.today \
      unless self.date_of_birth.nil?
    errors.add(:gender, 'attribute is invalid.') unless ['m', 'f'].include? self.gender.downcase \
      unless self.gender.nil?
    errors.add(:admission_no, 'can\'t be zero') if self.admission_no=='0'
      
  end

  def first_and_last_name
    "#{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def gender_as_text
    return (gender.downcase == 'f') ?  I18n.t('app.models.student.female') : I18n.t('app.models.student.male');
  end

  def user
    User.find_by_username self.admission_no
  end

  def all_batches
    self.graduated_batches + self.batch.to_a
  end

  def immediate_contact
    Guardian.find(self.immediate_contact_id) unless self.immediate_contact_id.nil?
  end

  def image_file=(input_data)
    return if input_data.blank?
    self.photo_filename     = input_data.original_filename
    self.photo_content_type = input_data.content_type.chomp
    self.photo_data         = input_data.read
  end

  def next_student
    next_st = self.batch.students.first(:conditions => "id > #{self.id}", :order => "id ASC")
    next_st ||= batch.students.first(:order => "id ASC")
  end

  def previous_student
    prev_st = self.batch.students.first(:conditions => "id < #{self.id}", :order => "admission_no DESC")
    prev_st ||= batch.students.first(:order => "id DESC")
    prev_st ||= self.batch.students.first(:order => "id DESC")
  end

  def finance_fee_by_date(date)
    FinanceFee.find_by_fee_collection_id_and_student_id(date.id,self.id)
  end

  def check_fees_paid(date)
    category = FinanceFeeCategory.find(date.fee_category_id)
    particulars = category.fees(self)

    financefee = date.fee_transactions(self.id)
    unless particulars.nil?
      return financefee.check_transaction_done unless financefee.nil?
      
    else
      return false
    end
  end

  def self.next_admission_no
    '' #stub for logic to be added later.
  end
  
  def get_fee_strucure_elements(date)
    elements = FinanceFeeStructureElement.get_student_fee_components(self,date)
    elements[:all] + elements[:by_batch] + elements[:by_category] + elements[:by_batch_and_category]
  end

  def total_fees(particulars)
    total = 0
    particulars.each do |fee|
      total += fee.amount
    end
    total
  end

  def archive_student(status)
    self.update_attributes(:is_active => false, :status_description => status)
    student_attributes = self.attributes
    student_attributes["former_id"]= self.id
    student_attributes.delete "id"
    if archived_student = ArchivedStudent.create(student_attributes)
      guardian = self.guardians
      user = User.find_by_username(self.admission_no)
      unless user.nil?
        user.delete
      end
      self.delete
      guardian.each do |g|
        g.archive_guardian(archived_student.id)
      end
      #
      student_exam_scores = ExamScore.find_all_by_student_id(self.id)
      student_exam_scores.each do |s|
        exam_score_attributes = s.attributes
        exam_score_attributes.delete "id"
        exam_score_attributes.delete "student_id"
        exam_score_attributes["student_id"]= archived_student.id
        ArchivedExamScore.create(exam_score_attributes)
        s.delete
      end
      #
    end
 
  end
  
  def student_user
    u = User.find_by_username(self.admission_no)
    u.nil? ? nil : u.id
  end

  def request_user_account_creation
    create_user_account unless student_user
  end

  private
  def create_user_account
    if self.user  # Student has user account
      logger.error "Student (:id => #{self.id}) has an user (#{self.user.inspect}) associated."
      logger.error "No user account will be created for student (:id => #{self.id})."
    else  # Student does not have user account
      existing_user = User.find_by_username(self.admission_no)

      if existing_user
        logger.warn "User (:id => #{existing_user.id}) has reserved this username."
        logger.warn "No user account will be created for student (:id => #{self.id})."
      else
        user = User.new do |u|
          u.first_name, u.last_name, u.username = first_name, last_name, admission_no.to_s
          u.password = "#{admission_no.to_s}123"
          u.role = 'Student'
          u.email = ( email.nil? or email == '' or User.find_by_email(email) ) ? "noreply#{admission_no.to_s}@interkidsonline.com" : email
        end

        logger.error "Errors on save user => #{user.errors.inspect}" unless user.valid?
        user.save
      end
    end
  end

  def self.fix_student_admission_no(students = [])

    students.each do |s|
      old = s.admission_no
      new = s.admission_no.delete('-')

      logger.info "Checking student (:id => #{s.id}, :admission_no => #{s.admission_no})"
      
      if old == new
        logger.info "\tStudent does not requiere and will not be changed"
      else
        logger.info "\tAttempt to fix student (:admission_no => #{old}, :new_admission_no => #{new})"

        existing_user = User.find_by_username(new)
        existing_student = Student.find_by_admission_no(new)

        if existing_student and existing_user
          logger.warn "\tUser (id => #{existing_user.id}) and student (id => #{existing_student.id}) existing."
          logger.info "\tStudent will not be changed"
        elsif existing_student and not existing_user
          logger.error "\tStudent (id => #{existing_student.id}) has reserved this admission_no."
        elsif not existing_student and existing_user
          logger.error "\tUser (id => #{existing_user.id}) has reserved this username."
        else
          
          if s.user  # Student has an user associated
            logger.info "\tUser associated #{s.user.inspect}"
            s.user.username = new
            puts "\tErrors on save user => #{s.user.errors.inspect}" unless s.user.valid?

            if s.user.save
              s.admission_no = s.user.username
              puts "\tErrors on save student => #{s.errors.inspect}" unless s.valid?
              s.save
            end
          else  # Student has not an user associated
            logger.info "\tNo user associated #{s.user.inspect}"
            s.admission_no = new
            logger.error "\tErrors on save => #{s.errors.inspect}" unless s.valid?
            s.save
          end

        end

      end
    end
  end

end
