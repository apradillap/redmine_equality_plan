# frozen_string_literal: true

module RedmineEqualityPlan
  module RedminePatch
    module UserPatch
      User.class_eval do
        after_create :define_gender

        scope :in_company, proc {
          User.in_company_custom
        }

        scope :receiving_training, lambda {
          custom_receiving_training
        }

        scope :worker_on_leave, lambda {
          custom_worker_on_leave
        }

        scope :male, lambda {
          joins(Arel.sql("inner join custom_values on custom_values.customized_id = #{table_name}.id"))
          .where('users.admin=false AND custom_values.custom_field_id = ?', CustomField.gender_custom_field_id)
          .where('custom_values.value = ?', 'male')
        }

        scope :dismissal_male, lambda {
          joins(Arel.sql("inner join custom_values on custom_values.customized_id = #{table_name}.id"))
          .where('users.admin=false AND users.status = 3 AND custom_values.custom_field_id = ?', CustomField.gender_custom_field_id)
          .where('custom_values.value = ?', 'male')
        }

        scope :female, lambda {
          joins(Arel.sql("inner join custom_values on custom_values.customized_id = #{table_name}.id"))
          .where('users.admin=false AND custom_values.custom_field_id = ?', CustomField.gender_custom_field_id)
          .where('custom_values.value = ?', 'female')
        }

        scope :dismissal_female, lambda {
          joins(Arel.sql("inner join custom_values on custom_values.customized_id = #{table_name}.id"))
          .where('users.admin=false AND users.status = 3 AND custom_values.custom_field_id = ?', CustomField.gender_custom_field_id)
          .where('custom_values.value = ?', 'female')
        }

        scope :andy, lambda {
          joins(Arel.sql("inner join custom_values on custom_values.customized_id = #{table_name}.id"))
          .where('users.admin=false AND custom_values.custom_field_id = ?', CustomField.gender_custom_field_id)
          .where('custom_values.value = ? OR custom_values.value = ?', 'andy', '')
        }

        scope :for_age_range, lambda { |min, max|
          User.active.in_company.for_age_range_custom(min, max)
        }

        scope :for_contract_date_range, lambda { |min, max|
          User.active.in_company.for_contract_date_range_custom(min, max)
        }

        scope :with_salary, lambda {
          User.custom_with_salary
        } 

        scope :internal_talks, lambda {
          User.custom_internal_talks
        }

        scope :technicians, -> {
          User.custom_technicians
        }

        def gender
          d = GenderDetector.new
          d.get_gender(firstname, :spain).to_s.gsub('mostly_', '')
        end

        def gender_custom_field
          gender_custom_field_id = CustomField.gender_custom_field_id
          custom_values.where(custom_field_id: gender_custom_field_id)
        end

        def contract_types
          User.custom_contract_types
        end

        def salary_amount
          custom_salary_amount
        end

        def invested_in_training_amount
          custom_invested_in_training_amount
        end

        def self.technicians
          custom_technicians
        end

        def define_gender
          gender_custom_field.create!(value: gender)
       end
      end
    end
  end
end
