module RedmineEqualityPlan
  module RedminePatch
    module UserPatch
      User.class_eval do
        scope :in_company, proc {
          User.in_company_custom
        }

        scope :male, proc {
          gender_custom_field_id = CustomField.gender_custom_field_id
          male_ids = CustomField.find(gender_custom_field_id).custom_values.where(value: 'male').map(&:customized_id)
          User.in_company.where(id: male_ids)
        }

        scope :female, proc {
          gender_custom_field_id = CustomField.gender_custom_field_id
          female_ids = CustomField.find(gender_custom_field_id).custom_values.where(value: 'female').map(&:customized_id)
          User.in_company.where(id: female_ids)
        }

         scope :andy, proc {
          gender_custom_field_id = CustomField.gender_custom_field_id
          andy_ids = CustomField.find(gender_custom_field_id).custom_values.where(value: 'andy').map(&:customized_id)
          User.in_company.where(id: andy_ids)
        }

        def gender
          d = GenderDetector.new
          d.get_gender(self.firstname, :spain).to_s.gsub('mostly_','')
        end

        def gender_custom_field
          gender_custom_field_id = CustomField.gender_custom_field_id
          self.custom_values.where(custom_field_id: gender_custom_field_id)
        end

        def contract_types
          User.custom_contract_types
        end

        scope :for_age_range, -> min, max {
          User.active.in_company.for_age_range_custom(min,max)
        }
      end
    end
  end
end
