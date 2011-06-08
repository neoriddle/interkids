authorization do

  #custom - privileges
  role :examination_control do
#    has_permission_on [:exam],
#      :to => [
#        :index,
#        :create_exam,
#        :update_batch,
##        :create_examtype,
#        :create,:create_grading,
#        :delete,
#        :delete_examtype,
#        :delete_grading,
#        :edit,
#        :edit_examtype,
#        :edit_grading,
#        :grading_form_edit,
#        :rename_grading,
#        :update_subjects_dropdown,
#        :publish,
#        :grouping,
#        :update_exam_form,
#        :exam_wise_report,
#        :list_exam_types,
#        :generated_report,
#        :graph_for_generated_report,
#        :generated_report_pdf,
##        :consolidated_exam_report,
#        :consolidated_exam_report_pdf,
#        :subject_wise_report,
#        :list_subjects,
#        :generated_report2,
#        :generated_report2_pdf,
#        :grouped_exam_report,
#        :final_report_type,
#        :generated_report4,
#        :generated_report4_pdf
#        ]
#    has_permission_on [:exam_groups],
#      :to => [
#        :index,
#        :new,
#        :create,
#        :update,
#        :destroy,
#        :show,
#        :edit,
#        :set_exam_minimum_marks,
#        :set_exam_maximum_marks,
#        :set_exam_weightage
#    ]
#    has_permission_on [:exams],
#      :to => [
#        :index,
#        :show,
#        :new,
#        :create,
#        :edit,
#        :update,
#        :destroy,
#        :save_scores,
#        :query_data
#    ]
#    has_permission_on [:additional_exam],
#      :to => [
#      :index,
#      :update_exam_form,
#      :publish,
#      :create_additional_exam,
#      :update_batch
#    ]

#    has_permission_on [:additional_exam_groups],
#      :to => [
#      :index,
#      :new,
#      :create,
#      :edit,
#      :update,
#      :destroy,
#      :show,
#      :initial_queries,
#      :set_additional_exam_minimum_marks,
#      :set_additional_exam_maximum_marks,
#      :set_additional_exam_weightage,
#      :set_additional_exam_group_name
#    ]
#    has_permission_on [:additional_exams],
#      :to => [
#      :index,
#      :show,
#      :new,
#      :create,
#      :edit,
#      :update,
#      :destroy,
#      :save_additional_scores,
#      :query_data
#    ]
    has_permission_on [:grading_levels],
      :to => [
        :index,
        :show,
        :edit,
        :update,
        :new,
        :create,
        :destroy

    ]
  end

  role :enter_results  do
#    has_permission_on [:exam],
#      :to => [
#        :index,
#        :create_exam,
#        :update_batch,
#        :exam_wise_report,
#        :list_exam_types,
#        :generated_report,
#        :graph_for_generated_report,
#        :generated_report_pdf,
#        :consolidated_exam_report,
#        :consolidated_exam_report_pdf,
#        :subject_wise_report,
#        :list_subjects,
#        :generated_report2,
#        :generated_report2_pdf,
#        :grouped_exam_report,
#        :final_report_type,
#        :generated_report4,
#        :generated_report4_pdf
#        ]
#    has_permission_on [:exam_groups],
#      :to => [
#        :index,
#        :show,
#        :set_exam_minimum_marks,
#        :set_exam_maximum_marks,
#        :set_exam_weightage,
#        :set_exam_group_name
#        ]
#    has_permission_on [:exams],
#      :to => [
#        :index,
#        :show,
#        :save_scores,
#        :edit,
#        :update
#        ]
#    has_permission_on [:additional_exam],
#      :to =>[
#        :create_additional_exam,
#        :update_batch,
#        :publish
#      ]
#    has_permission_on [:additional_exam_groups],
#      :to =>[
#        :index,
#        :show,
#        :set_additional_exam_minimum_marks,
#        :set_additional_exam_maximum_marks,
#        :set_additional_exam_weightage,
#        :set_additional_exam_group_name
#      ]
#    has_permission_on [:additional_exams],
#      :to => [
#        :index,
#        :show,
#        :save_additional_scores,
#        :edit,
#        :update
#        ]
  end

  role :view_results  do
#    has_permission_on [:exam], :to => [:index,
#        :exam_wise_report,
#        :list_exam_types,
#        :generated_report,
#        :graph_for_generated_report,
#        :generated_report_pdf,
#        :consolidated_exam_report,
#        :consolidated_exam_report_pdf,
#        :subject_wise_report,
#        :list_subjects,
#        :generated_report2,
#        :generated_report2_pdf,
#        :grouped_exam_report,
#        :final_report_type,
#        :generated_report4,
#        :generated_report4_pdf
#    ]
#    has_permission_on [:examination_result],
#      :to => [
#        :load_results,
#        :load_one_sub_result,
#        :load_all_sub_result,
#        :update_examtypes,
#        :update_subjects,
#        :update_one_subject,
#        :update_exams,
#        :update_one_sub_exams,
#        :one_sub_pdf,
#        :all_sub_pdf,
#        :view_all_subs,
#        :view_one_sub ]
  end

  role :admission do
    has_permission_on [:student],
      :to => [
        :profile,
        :admission1,
        :admission2,
        :admission3,
        :previous_data,
        :previous_subject,
        :save_previous_subject,
        :admission4,
        :profile,
        :add_guardian,
        :edit,
        :edit_guardian,
        :guardians,
        :del_guardian,
        :list_students_by_course,
        :show,
        :view_all,
        :profile_pdf,
        :edit,
        :show_previous_details,
        :remove,
        :change_to_former,
        :delete,
        :generate_tc_pdf,
        :edit_admission4
    ]
  end

  role :students_control do
    has_permission_on [:student] , 
      :to => [
        :academic_reports_pdf,
        :academic_report,
        :academic_report_all,
        :profile,
        :guardians,
        :list_students_by_course,
        :show,
        :view_all,
        :index,
        :change_to_former,
        :delete,:destroy,
        :email,
        :exam_report,
        :update_student_result_for_examtype,
        :previous_years_marks_overview,
        :remove,:reports,
        :search_ajax,
        :subject_wise_report,
        :graph_for_previous_years_marks_overview,
        :graph_for_student_annual_overview,
        :graph_for_subject_wise_report_for_one_subject,
        :graph_for_exam_report,
        :graph_for_academic_report,
        :generate_tc_pdf,
        :generate_all_tc_pdf,
        :advanced_search,
        :advanced_search_pdf,
        :edit,
        :profile_pdf,
        :edit_guardian,
        :del_guardian,
        :add_guardian,
        :show_previous_details,
        :list_doa_year,
        :doa_equal_to_update,
        :doa_less_than_update,
        :doa_greater_than_update,
        :list_dob_year,
        :dob_equal_to_update,
        :dob_less_than_update,
        :dob_greater_than_update,
        :list_batches,
        :find_student
      ]
    has_permission_on [:archived_student],
      :to => [
        :profile,
        :reports,
        :guardians,
        :delete,
        :destroy,
        :generate_tc_pdf,
        :consolidated_exam_report,
        :consolidated_exam_report_pdf,
        :academic_report,
        :student_report,
        :generated_report,
        :generated_report_pdf,
        :generated_report3,
        :previous_years_marks_overview,
        :generated_report4,
        :generated_report4_pdf,
        :graph_for_generated_report,
        :graph_for_generated_report3,
        :graph_for_previous_years_marks_overview
      ]
#    has_permission_on [:exam],
#      :to =>[
#        :generated_report,
#        :generated_report_pdf,
#        :consolidated_exam_report,
#        :consolidated_exam_report_pdf,
#        :generated_report3,
#        :generated_report3_pdf,
#        :generated_report4,
#        :generated_report4_pdf,
#        :graph_for_generated_report,
#        :graph_for_generated_report3,
#        :previous_years_marks_overview,
#        :academic_report,
#        :graph_for_previous_years_marks_overview
#      ]
    has_permission_on [:student_attendance],
      :to =>[
        :student,
        :month
      ]
  end

  role :manage_news do
#    has_permission_on [:news],
#      :to => [
#        :index,
#        :add,
#        :add_comment,
#        :all,
#        :delete,
#        :delete_comment,
#        :edit,
#        :search_news_ajax,
#        :view ]
  end

  role :timetable do
    
    has_permission_on [:class_timings], :to => [:index, :edit, :destroy, :show, :new, :create, :update]
    has_permission_on [:weekday], :to => [:index, :week, :create]
    has_permission_on [:timetable],
      :to => [
        :index,
        :edit,
        :delete_subject,
        :select_class,
        :tt_entry_update,
        :tt_entry_noupdate,
        :update_multiple_timetable_entries,
        :update_timetable_view,
        :generate,
        :extra_class,
        :extra_class_edit,
        :list_employee_by_subject,
        :save_extra_class,
        :timetable,
        :weekdays,
        :view,
        :select_class2,
        :edit2,
        :update_employees,
        :update_multiple_timetable_entries2,
        :delete_employee2,
        :tt_entry_update2,
        :tt_entry_noupdate2,
        :timetable_pdf
        ]
  end

  role :timetable_view do
    has_permission_on [:timetable], :to => [:index,:select_class,:view, :update_timetable_view, :timetable_pdf, :timetable]
  end

  role :student_attendance_view do
    has_permission_on [:attendance], :to => [:index,:report,:student_report]
    has_permission_on [:attendance_reports], :to => [:index, :subject, :mode, :show, :year, :report, :filter, :student_details]
    has_permission_on [:student_attendance], :to => [:index, :student]
  end

  role :student_attendance_register do
    has_permission_on [:attendance], :to => [:index,:register,:register_attendance]
    has_permission_on [:attendances], :to => [:index, :list_subject, :show, :new, :create, :edit,:update, :destroy]
    has_permission_on [:student_attendance], :to => [:index]
    has_permission_on [:attendance_reports], :to => [:index, :subject, :mode, :show, :year, :report, :filter, :student_details]
  end

  role :add_new_batch do
    has_permission_on [:configuration], :to => [:index]
    has_permission_on [:courses], :to => [:index,:manage_course, :manage_batches,:find_course, :new, :create,:destroy,:edit,:update, :show, :update_batch]
    has_permission_on [:batches], :to => [:index, :new, :create,:destroy,:edit,:update, :show, :init_data]
    has_permission_on [:subjects], :to => [:index, :new, :create,:destroy,:edit,:update, :show]
    has_permission_on [:student], :to => [:electives, :assign_students, :unassign_students, :assign_all_students, :unassign_all_students, :profile, :guardians, :show_previous_details]
    has_permission_on [:batch_transfers],
      :to => [
        :index,
        :show,
        :transfer,
        :graduation,
        :subject_transfer,
        :get_previous_batch_subjects,
        :update_batch,
        :assign_previous_batch_subject,
        :assign_all_previous_batch_subjects,
        :new_subject,
        :create_subject
    ]
  end

  role :subject_master do
    has_permission_on [:configuration], :to => [:index]
    has_permission_on [:student], :to => [:electives, :assign_students, :unassign_students, :assign_all_students, :unassign_all_students]
    has_permission_on [:subjects],        :to => [:index,:new,:create,:destroy,:edit, :update,:show]
  end

  role :academic_year do
    has_permission_on [:configuration], :to => [:index]
    has_permission_on [:academic_year],
      :to => [
        :index,
        :add_course,
        :migrate_classes,
        :migrate_students,
        :list_students,
        :update_courses,
        :upcoming_exams ]
  end
  role :sms_management do
    has_permission_on [:configuration], :to => [:index]
    has_permission_on [:sms], :to => [:index, :settings, :students, :batches, :employees, :departments,:all, :update_general_sms_settings, :list_students, :sms_all, :list_employees]
  end
  role :event_management do
    
    has_permission_on [:event], :to => [:index, :show, :confirm_event, :cancel_event, :select_course, :event_group, :course_event, :remove_batch, :select_employee_department, :department_event, :remove_department]
  end

  role :general_settings do
    has_permission_on [:configuration], :to => [:index,:settings,:permissions]
    has_permission_on [:student], :to => [:add_additional_details, :delete_additional_details, :edit_additional_details, :categories ]
  end

  role :finance_control do
    has_permission_on [:finance],
      :to => [
        :index,
        :automatic_transactions,
        :categories,
        :donation,
        :donation_receipt,
        :expense_create,
        :expense_edit,
        :fee_collection,
        :fee_submission,
        :fees_received,
        :fee_structure,
        :fees_student_specific,
        :income_create,
        :income_edit,
        :transactions,
        :category_create,
        :category_delete,
        :category_edit,
        :category_update,
        :get_child_fee_element_form,
        :get_new_fee_element_form,
        :create_child_fee_element,
        :create_new_fee_element,
        :reset_fee_element,
        :fee_collection_create,
        :fee_collection_delete,
        :fee_collection_edit,
        :fee_collection_update,
        :fee_structure_create,
        :fee_structure_delete,
        :fee_structure_edit,
        :fee_structure_update,
        :transaction_trigger_create,
        :fees_student_search,
        :search_logic,
        :fees_received,
        :fees_defaulters,
        :list_students_by_course_fees_dues,
        :fees_index,
        :fees_create,
        :master_fees,
        :master_category_new,
        :master_category_create,
        :master_category_edit,
        :master_category_update,
        :master_category_particulars,
        :master_category_particulars_edit,
        :master_category_particulars_update,
        :master_category_particulars_delete,
        :master_category_delete,
        :fees_particulars_new,
        :fees_particulars_create,
        :additional_fees_create_form,
        :additional_fees_create,
        :additional_fees_edit,
        :additional_fees_update,
        :additional_fees_delete,
        :add_particulars,
        :add_particulars_new,
        :add_particulars_create,
        :student_or_student_category,
        :additional_fees_list,
        :additional_particulars,
        :add_particulars_edit,
        :add_particulars_update,
        :add_particulars_delete,
        :fee_collection_batch_update,
        :fee_collection_new,
        :fee_collection_create,
        :fee_collection_view,
        :fee_collection_dates_batch,
        :fee_collection_edit,
        :fee_collection_update,
        :fee_collection_delete,
        :fees_submission_batch,
        :update_fees_collection_dates,
        :load_fees_submission_batch,
        :update_ajax,
        :student_fee_receipt_pdf,
        :update_fine_ajax,
        :search_logic,
        :fees_student_dates,
        :fees_submission_student,
        :update_student_fine_ajax,
        :fees_submission_save,
        :fees_student_structure_search_logic,
        :fees_structure_dates,
        :fees_structure_for_student,
        :student_fees_structure,
        :fees_defaulters,
        :update_fees_collection_dates_defaulters,
        :fees_defaulters_students,
        :fee_defaulters_pdf,
        :pay_fees_defaulters,
        :update_defaulters_fine_ajax,
        :report_compare,
        :month_date,
        :pdf_fee_structure,
        :graph_for_update_monthly_report,
        :graph_for_compare_monthly_report,
        :graph_for_transaction_comparison,
        :fees_student_structure_search,
        :reports
        ]
    has_permission_on [:xml],
      :to => [
        :index,
        :settings,
        :create_xml
        ]
  end

  role :hr_basics do
    has_permission_on [:employee],
      :to => [
        :index,
        :add_category,
        :edit_category,
        :delete_category,
        :add_position,
        :edit_position,
        :delete_position,
        :add_department,
        :edit_department,
        :delete_department,
        :add_grade,
        :edit_grade,
        :delete_grade,
        :admission1,
        :update_positions,
        :edit1,
        :edit_personal,
        :admission2,
        :edit2,
        :edit_contact,
        :admission3,
        :edit3,
        :admission3_1,
        :edit3_1,
        :admission4,
        :change_reporting_manager,
        :reporting_manager_search,
        :update_reporting_manager_name,
        :edit4,
        :search,
        :search_ajax,
        :select_reporting_manager,
        :profile,
        :profile_general,
        :profile_personal,
        :profile_address,
        :profile_contact,
        :profile_bank_details,
        :profile_payroll_details,
        :view_all,
        :show,
        :subject_assignment,
        :update_subjects,
        :select_department,
        :update_employees,
        :assign_employee,
        :remove_employee,
        :hr,
        :select_department_employee,
        :settings,
        :employee_management,
        :add_bank_details,
        :edit_bank_details,
        :add_additional_details,
        :edit_additional_details,
        :delete_bank_details,
        :delete_additional_details,
        :edit_privilege,
        :employees_list,
        :profile_pdf,
        :leave_management,
        :update_employees_select,
        :leave_list
        
    ]
    has_permission_on [:payroll] ,
      :to => [
        :add_category,
        :edit_category,
        :manage_payroll,
        :activate_category,
        :delete_category,
        :inactivate_category ]
    has_permission_on [:employee_attendance],
      :to => [
        :leave_app]
  end

  role :employee_attendance do
    has_permission_on [:employee],
      :to => [
        :hr,
        :employee_attendance
         ]
    has_permission_on [:employee_attendances],
      :to => [
        :index,
        :show,
        :new,
        :create,
        :edit,
        :update,
        :destroy

        ]
    has_permission_on [:employee_attendance],
      :to => [
        :add_leave_types,
        :register,
        :report,
        :leave_management,
        :edit_leave_types,
        :update_attendance_form,
        :update_attendance_report,
        :individual_leave_application,
        :all_employee_new_leave_application,
        :all_employee_leave_application,
        :update_employees_select,
        :leave_list,
        :leave_app,
        :emp_attendance,
        :employee_attendance_pdf ]
  end

  role :payslip_powers do
    has_permission_on [:employee],
      :to => [
        :hr,
        :payslip,
        :select_department_employee,
        :update_employee_select_list,
        :payslip_date_select,
        :one_click_payslip_generation,
        :payslip_revert_date_select,
        :one_click_payslip_revert,
        :ceate_monthly_select_list,
        :add_payslip_category,
        :create_payslip_category,
        :remove_new_paylist_category,
        :delete_payslip,
        :view_payslip,
        :update_monthly_payslip,
        :invidual_payslip_pdf,
        :create_monthly_payslip,
        :payslip_approve,
        :one_click_approve,
        :one_click_approve_submit,
        :department_payslip,
        :update_employee_payslip,
        :department_payslip_pdf,
        :employee_individual_payslip_pdf
        ]
    has_permission_on [:payroll],
      :to => [
        :edit_payroll_details,
        :activate_category,
        :inactivate_category ]
  end

  role :employee_search do
    has_permission_on [:employee],
      :to => [
        :search,
        :view_all,
        :search_ajax,
        :profile,
        :view_all]
  end

  role :employee_timetable_access do
    has_permission_on [:employee], :to => [:timetable,:timetable_pdf]
  end

  # admin privileges
  role :admin do
    has_permission_on [:user],  :to => [:edit_privilege]
    has_permission_on [:weekday], :to => [:index, :week, :create]
    #has_permission_on [:event],
    #  :to => [
    #    :index,
    #    :event_group,
    #    :select_course,
    #    :course_event,
    #    :remove_batch,
    #    :select_employee_department,
    #    :department_event,
    #    :remove_department,
    #    :show,
    #    :confirm_event,
    #    :cancel_event
    #]
    has_permission_on [:cash_boxes], :to => [:index, :show, :new, :edit, :create, :update, :destroy]
    has_permission_on [:academic_year],
      :to => [
        :index,
        :add_course,
        :migrate_classes,
        :migrate_students,
        :list_students,
        :update_courses,
        :upcoming_exams ]
    has_permission_on [:cash_boxes],
      :to => [
        :index,
        :show,
        #:edit,
        :new,
        :create ]
    has_permission_on [:attendances],
      :to => [
        :index,
        :show,
        :new,
        :create,
        :edit,
        :destroy,
        :list_subject
    ]
    #has_permission_on [:sms],  :to => [:index, :settings, :update_general_sms_settings, :students, :list_students, :batches, :sms_all, :employees, :list_employees, :departments, :all]
    #has_permission_on [:sms_settings],  :to => [:index, :update_general_sms_settings]
    has_permission_on [:class_timings],  :to => [:index, :edit, :destroy, :show, :new, :create, :update]
    has_permission_on [:attendance_reports], :to => [:index, :subject, :mode, :show, :year, :report, :filter, :student_details]
    has_permission_on [:student_attendance], :to => [:index, :student, :month]
    has_permission_on [:configuration], :to => [:index,:settings,:permissions, :add_weekly_holidays, :delete]
    has_permission_on [:subjects], :to => [:index, :new, :create,:destroy,:edit,:update, :show]
    has_permission_on [:courses],
      :to => [
        :index,
        :manage_course,
        :manage_batches,
        :new,
        :create,
        :update_batch,
        :edit,
        :update,
        :destroy,
        :show,
        :find_course
    ]
    has_permission_on [:batches],
      :to => [
        :index,
        :new,
        :create,
        :edit,
        :update,
        :destroy,
        :show,
        :init_data
    ]
    has_permission_on [:batch_transfers],
      :to => [
        :index,
        :show,
        :transfer,
        :graduation,
        :subject_transfer,
        :get_previous_batch_subjects,
        :update_batch,
        :assign_previous_batch_subject,
        :assign_all_previous_batch_subjects,
        :new_subject,
        :create_subject
    ]
    has_permission_on [:employee_attendance],
      :to => [
        :index,
        :add_leave_types,
        :edit_leave_types,
        :register,
        :update_attendance_form,
        :report,
        :update_attendance_report,
        :emp_attendance,
        :leaves,
        :leave_application,
        :leave_app,
        :approve_remarks,
        :deny_remarks,
        :approve_leave,
        :deny_leave,
        :cancel,
        :new_leave_applications,
        :all_employee_new_leave_applications,
        :all_leave_applications,
        :individual_leave_applications,
        :own_leave_application,
        :cancel_application,
        :employee_attendance_pdf,
        :update_all_application_view ]
    has_permission_on [:employee_attendances],
      :to => [
        :index,
        :show,
        :new,
        :create,
        :edit,
        :update,
        :destroy
      ]
    has_permission_on [:grading_levels],
      :to => [
        :index,
        :show,
        :edit,
        :update,
        :new,
        :create,
        :destroy

    ]
#    has_permission_on [:exam],
#      :to => [
#        :index,
#        :update_exam_form,
#        :publish,
#        :grouping,
#        :exam_wise_report,
#        :list_exam_types,
#        :generated_report,
#        :generated_report_pdf,
#        :consolidated_exam_report,
#        :consolidated_exam_report_pdf,
#        :subject_wise_report,
#        :list_subjects,
#        :generated_report2,
#        :generated_report2_pdf,
#        :generated_report3,
#        :final_report_type,
#        :generated_report4,
#        :generated_report4_pdf,
#        :previous_years_marks_overview,
#        :academic_report,
#        :create_exam,
#        :update_batch_ex_result,
#        :update_batch,
#        :graph_for_generated_report,
#        :graph_for_generated_report3,
#        :graph_for_previous_years_marks_overview,
#        :grouped_exam_report
#    ]
#    has_permission_on [:exam_groups],
#      :to => [
#        :index,
#        :new,
#        :create,
#        :edit,
#        :update,
#        :destroy,
#        :show,
#        :initial_queries,
#        :set_exam_minimum_marks,
#        :set_exam_maximum_marks,
#        :set_exam_weightage,
#        :set_exam_group_name
#    ]
#    has_permission_on [:exams],
#      :to => [
#        :index,
#        :show,
#        :new,
#        :create,
#        :edit,
#        :update,
#        :destroy,
#        :save_scores,
#        :query_data
#    ]

#    has_permission_on [:additional_exam],
#      :to => [
#        :index,
#        :update_exam_form,
#        :publish,
#        :create_additional_exam,
#        :update_batch
#    ]

#    has_permission_on [:additional_exam_groups],
#      :to => [
#        :index,
#        :new,
#        :create,
#        :edit,
#        :update,
#        :destroy,
#        :show,
#        :initial_queries,
#        :set_additional_exam_minimum_marks,
#        :set_additional_exam_maximum_marks,
#        :set_additional_exam_weightage,
#        :set_additional_exam_group_name
#    ]
#    has_permission_on [:additional_exams],
#      :to => [
#        :index,
#        :show,
#        :new,
#        :create,
#        :edit,
#        :update,
#        :destroy,
#        :save_additional_scores,
#        :query_data
#    ]

#    has_permission_on [:examination_result],
#      :to => [
#        :add,
#        :add_results,
#        :save,
#        :update_subjects,
#        :update_one_subject,
#        :update_exams,
#        :update_one_sub_exams,
#        :load_results,
#        :load_one_sub_result,
#        :load_all_sub_result,
#        :update_examtypes,
#        :one_sub_pdf,
#        :all_sub_pdf,
#        :view_all_subs,
#        :view_one_sub,
#        :academic_report_course,
#        :all_academic_report,
#        :list_students_by_course,
#        :exam_wise_report,
#        :load_examtypes,
#        :load_course_all_student,
#        :exam_report
#    ]
    has_permission_on [:finance],
      :to => [
        :index,
        :automatic_transactions,
        :categories,
        :donation,
        :donation_receipt,
        :expense_create,
        :expense_edit,
        :fee_collection,
        :fee_submission,
        :fees_received,
        :fee_structure,
        :fees_student_specific,
        :income_create,
        :load_students_for_income,
        :income_edit,
        :transactions,
        :category_create,
        :category_delete,
        :category_edit,
        :category_update,
        :get_child_fee_element_form,
        :get_new_fee_element_form,
        :create_child_fee_element,
        :create_new_fee_element,
        :reset_fee_element,
        :fee_collection_create,
        :fee_collection_delete,
        :fee_collection_edit,
        :fee_collection_update,
        :fee_structure_create,
        :fee_structure_delete,
        :fee_structure_edit,
        :fee_structure_update,
        :transaction_trigger_create,
        :fees_student_search,
        :search_logic,
        :fees_received,
        :fees_defaulters,
        :fees_submission_index,
        :fees_submission_batch,
        :update_fees_collection_dates,
        :load_fees_submission_batch,
        :update_ajax,
        :update_fees_collection_dates_defaulters,
        :fees_defaulters_students,
        :monthly_report,
        :update_monthly_report,
        :year_report,
        :update_year_report,
        :approve_monthly_payslip,
        :one_click_approve_submit,
        :one_click_approve,
        :employee_payslip_approve,
        :payslip_index,
        :view_monthly_payslip,
        :view_monthly_payslip_search,
        :update_monthly_payslip,:search_ajax,
        :view_payslip_dept,
        :update_dates,
        :update_monthly_payslip_all,
        :fee_structure_select_batch,
        :fees_student_dates,
        :fee_structure_batch,
        :fees_structure_student_search,
        :search_fees_structure,
        :fees_structure_dates,
        :fees_structure_result,
        :salary_department,
        :salary_employee,
        :employee_payslip_monthly_report,
        :direct_expenses,
        :direct_income,
        :donations_report,
        :fees_report,
        :batch_fees_report,
        :salary_department_year,
        :salary_employee_year,
        :direct_expenses_year,
        :direct_income_year,
        :donations_report_year,
        :fees_report_year,
        :asset_liability,
        :liability,
        :create_liability,
        :view_liability,
        :each_liability_view,
        :asset,
        :create_asset,
        :view_asset,
        :each_asset_view,
        :edit_liability,
        :update_liability,
        :delete_liability,
        :edit_asset,
        :update_asset,
        :delete_asset,
        :fee_collection_view,
        :fee_collection_dates_batch,
        :pay_fees_defaulters,
        :fee_structure_fee_collection_date,
        :fees_student_specific_dates,
        :update_fees_specific,
        :fees_index,
        #new_fee-----------
        :fees_create,
        :master_fees,
        :fees_particulars,
        :additional_fees,
        :additional_fees_create_form,
        :additional_fees_create,
        :additional_fees_view,
        :add_particulars,
        :fee_collection_batch_update,
        :fees_submission_student,
        :fees_submission_save,
        :fee_particulars_update,
        :student_or_student_category,
        :fees_student_structure_search,
        :fees_student_structure_search_logic,
        :fee_structure_dates,
        :fees_structure_for_student,
        :master_fees_index,
        :master_category_create,
        :master_category_new,
        :fees_particulars_new,
        :fees_particulars_create,
        :add_particulars_new,
        :add_particulars_create,
        :fee_collection_new,
        :fee_collection_create,
        :categories_new,
        :categories_create,
        :master_category_edit,
        :master_category_update,
        :master_category_delete,
        :master_category_particulars,
        :master_category_particulars_edit,
        :master_category_particulars_update,
        :master_category_particulars_delete,
        :additional_fees_list,
        :additional_particulars,
        :add_particulars_edit,
        :add_particulars_update,
        :add_particulars_delete,
        :additional_fees_edit,
        :additional_fees_update,
        :additional_fees_delete,
        :month_date,
        :compare_report,
        :report_compare,
        :graph_for_compare_monthly_report,
        :update_fine_ajax,
        :student_fee_receipt_pdf,
        :student_fee_particular_receipt_pdf,
        :update_student_fine_ajax,
        :transaction_pdf,
        :update_defaulters_fine_ajax,
        :fee_defaulters_pdf,
        :donation_receipt_pdf,
        :donors,

        #pdf-------------
        :pdf_fee_structure,

        #graph-------------
        :graph_for_update_monthly_report,

        :reports,
        :transaction_report,
        :update_categories_for_transaction_report,
        :generate_transaction_report,

        :generate_invoices_report,
        :generate_receipts_report
    ]
        
    has_permission_on [:xml], :to =>
      [
      :create_xml,
        :index,
        :settings,
        :download
    ]
        
    #has_permission_on [:holiday], :to => [:index,:edit,:delete]
#    has_permission_on [:news],
#      :to => [
#        :index,
#        :add,
#        :add_comment,
#        :all,
#        :delete,
#        :delete_comment,
#        :edit,
#        :search_news_ajax,
#        :view ]
    has_permission_on [:payroll],
      :to => [
        :index,
        :add_category,
        :edit_category,
        :delete_category,
        :activate_category,
        :inactivate_category,
        :manage_payroll,
        :update_dependent_fields,
        :edit_payroll_details ]
    has_permission_on [:student],
      :to => [
        :academic_pdf,
        :profile,
        :admission1,
        :admission2,
        :admission3,
        :add_guardian,
        :edit,
        :edit_guardian,
        :guardians,
        :del_guardian,
        :list_students_by_course,
        :show,
        :view_all,
        :index,
        :academic_report,
        :academic_report_all,
        :change_to_former,
        :delete,
        :destroy,
        :email,
        :exam_report,
        :update_student_result_for_examtype,
        :previous_years_marks_overview,
        :remove,
        :reports,
        :search_ajax,
        :student_annual_overview,
        :subject_wise_report,
        :graph_for_previous_years_marks_overview,
        :graph_for_academic_report,
        :graph_for_annual_academic_report,
        :graph_for_student_annual_overview,
        :graph_for_subject_wise_report_for_one_subject,
        :graph_for_exam_report,
        :category_update,
        :category_edit,
        :category_delete,
        :categories,
        :add_additional_details,
        :edit_additional_details,
        :delete_additional_details,
        :admission4,
        :advanced_search,
        :list_batches,
        :electives,
        :assign_students,
        :unassign_students,
        :list_doa_year,
        :doa_equal_to_update,
        :doa_less_than_update,
        :doa_greater_than_update,
        :list_dob_year,:dob_equal_to_update,:dob_less_than_update,:dob_greater_than_update,
        :advanced_search_pdf,
        :previous_data,
        :previous_subject,
        :save_previous_subject,
        :profile_pdf,
        :generate_tc_pdf,
        :generate_all_tc_pdf,
        :assign_all_students,
        :unassign_all_students,
        :edit_admission4,
        :admission3_1,
        :show_previous_details
    ]
    has_permission_on [:archived_student],
      :to => [
        :profile,
        :reports,
        :guardians,
        :delete,
        :destroy,
        :generate_tc_pdf,
        :consolidated_exam_report,
        :consolidated_exam_report_pdf,
        :academic_report,
        :student_report,
        :generated_report,
        :generated_report_pdf,
        :generated_report3,
        :previous_years_marks_overview,
        :generated_report4,
        :generated_report4_pdf,
        :graph_for_generated_report,
        :graph_for_generated_report3,
        :graph_for_previous_years_marks_overview
      ]
    has_permission_on [:subject],
      :to => [
        :index,
        :create,
        :delete,
        :edit,
        :list_subjects ]
    has_permission_on [:timetable],
      :to => [
        :index,
        :edit,
        :delete_subject,
        :select_class,
        :tt_entry_update,
        :tt_entry_noupdate,
        :update_multiple_timetable_entries,
        :view,
        :update_timetable_view,
        :tt_entry_noupdate2,
        :select_class2,
        :edit2,
        :update_employees,
        :update_multiple_timetable_entries2,
        :delete_employee2,
        :tt_entry_update2,
        :generate,
        :weekdays,
        :extra_class,
        :extra_class_edit,
        :list_employee_by_subject,
        :save_extra_class,
        :timetable,
        :timetable_pdf

    ]
    has_permission_on [:weekdays],
      :to => [
        :index,
        :new
    ]
    has_permission_on [:employee],
      :to => [
        :index,
        :add_category,
        :edit_category,
        :delete_category,
        :add_position,
        :edit_position,
        :delete_position,
        :add_department,
        :edit_department,
        :delete_department,
        :add_grade,
        :edit_grade,
        :delete_grade,
        :admission1,
        :update_positions,
        :edit1,
        :edit_personal,
        :admission2,
        :edit2,
        :edit_contact,
        :admission3,
        :edit3,
        :admission4,
        :change_reporting_manager,
        :reporting_manager_search,
        :update_reporting_manager_name,
        :edit4,
        :search,
        :search_ajax,
        :select_reporting_manager,
        :profile,
        :profile_general,
        :profile_personal,
        :profile_address,
        :profile_contact,
        :profile_bank_details,
        :profile_payroll_details,
        :view_all,
        :show,
        :add_payslip_category,
        :create_payslip_category,
        :remove_new_paylist_category,
        :create_monthly_payslip,
        :view_payslip,
        :update_monthly_payslip,
        :delete_payslip,
        :view_attendance,
        :subject_assignment,
        :update_subjects,
        :select_department,
        :update_employees,
        :assign_employee,
        :remove_employee,
        :hr,
        :payslip,
        :select_department_employee,
        :update_employee_select_list,
        :payslip_date_select,
        :one_click_payslip_generation,
        :payslip_revert_date_select,
        :one_click_payslip_revert,
        :leave_management,
        :all_employee_leave_applications,
        :update_employees_select,
        :leave_list,
        :reminder,
        :create_reminder,
        :to_employees,
        :update_recipient_list,
        :sent_reminder,
        :view_sent_reminder,
        :delete_reminder,
        :view_reminder,
        :mark_unread,
        :pull_reminder_form,
        :send_reminder,
        :individual_payslip_pdf,
        :settings,
        :employee_management,
        :employee_attendance,
        :employees_list,
        :add_bank_details,
        :edit_bank_details,
        :delete_bank_details,
        :admission3,
        :admission3_1,
        :add_additional_details,
        :edit_additional_details,
        :delete_additional_details,
        :profile_additional_details,
        :edit3_1,
        :advanced_search,
        :list_doj_year,
        :doj_equal_to_update,
        :doj_less_than_update,
        :doj_greater_than_update,
        :list_dob_year,:dob_equal_to_update,:dob_less_than_update,:dob_greater_than_update,
        :remove,:change_to_former,:delete,
        :edit_privilege,
        :advanced_search_pdf,
        :profile_pdf,
        :department_payslip,
        :update_employee_payslip,
        :department_payslip_pdf,
        :view_rep_manager,
        :payslip_approve,
        :one_click_approve,
        :one_click_approve_submit,
        :employee_individual_payslip_pdf
    ]

  end

  # student- privileges
  role :student do
    has_permission_on [:course], :to => [:view]
 #   has_permission_on [:exam], :to => [:generated_report, :generated_report4_pdf, :graph_for_generated_report, :academic_report, :previous_years_marks_overview, :graph_for_previous_years_marks_overview, :generated_report3, :graph_for_generated_report3 ,:generated_report4]
 #   has_permission_on [:examination_result],
 #     :to => [
 #       :load_results,
 #       :load_one_sub_result,
 #       :one_sub_pdf,
 #       :view_one_sub ]
    has_permission_on [:student],
      :to => [
        :exam_report,
        :show,
        :academic_pdf,
        :profile,
        :guardians,
        :list_students_by_course,
        :academic_report,
        :previous_years_marks_overview,
        :reports,
        :student_annual_overview,
        :subject_wise_report,
        :graph_for_previous_years_marks_overview,
        :graph_for_student_annual_overview,
        :graph_for_subject_wise_report_for_one_subject,
        :graph_for_exam_report,
        :graph_for_academic_report,
        :show_previous_details]
 #   has_permission_on [:news],
 #     :to => [
 #       :index,
 #       :all,
 #       :search_news_ajax,
 #       :view,
 #       :add_comment ]
    has_permission_on [:subject], :to => [:index,:list_subjects]
    has_permission_on [:timetable], :to => [:student_view,:update_timetable_view]
    has_permission_on [:attendance], :to => [:student_report]
    has_permission_on [:student_attendance], :to => [:index, :student, :month]
    has_permission_on [:finance], :to => [:student_fees_structure]
  end

  # employee -privileges
  role :employee do
    has_permission_on [:employee],
      :to => [
        :profile,
        :profile_general,
        :profile_personal,
        :profile_address,
        :profile_contact,
        :profile_bank_details,
        :profile_payroll_details,
        :profile_additional_details,
        :reminder,
        :sent_reminder,
        :create_reminder,
        :to_employees,
        :view_sent_reminder,
        :update_recipient_list,
        :delete_reminder_by_sender,
        :delete_reminder_by_recipient,
        :view_reminder,
        :mark_unread,
        :view_payslip,
        :view_attendance,
        :timetable,
        :timetable_pdf,
        :update_monthly_payslip,
        :create_reminder_1,
        :select_employee_department,
        :create_reminder_form,
        :select_student_course,
        :to_students,
        :all_employee_leave_applications,
        :individual_payslip_pdf,
        :show,
        :profile_pdf
        ]
 #   has_permission_on [:news],
 #     :to => [
 #       :index,
 #       :all,
 #       :search_news_ajax,
 #       :view,
 #       :add_comment ]
    has_permission_on [:employee_attendance],
      :to => [
        :index,
        :leaves,
        :leave_application,
        :own_leave_application,
        :cancel_application,
        :individual_leave_applications,
        :all_leave_applications,
        :update_all_application_view,
        :new_leave_applications,
        :approve_remarks,
        :approve_leave,
        :deny_remarks,
        :cancel,
        :all_employee_new_leave_applications,
        :employee_attendance_pdf]
    has_permission_on [:reminder],
      :to => [
        :reminder,
        :create_reminder,
        :select_employee_department,
        :select_student_course,
        :to_employees,
        :to_students,
        :update_recipient_list,
        :sent_reminder,
        :view_sent_reminder,
        :delete_reminder_by_sender,
        :delete_reminder_by_recipient,
        :view_reminder,
        :mark_unread ]
  end
end
