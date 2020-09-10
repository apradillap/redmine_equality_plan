module RedmineEqualityPlan
  module RedminePatch
    module UserPatch
      User.class_eval do
        scope :in_company, proc {
          User.in_company_custom
        }

        scope :male, -> {
            in_company.joins(Arel.sql("inner join custom_values on custom_values.customized_id = #{ self.table_name }.id"))
            .where("custom_values.custom_field_id = ?", CustomField.gender_custom_field_id)
            .where("custom_values.value = ?", 'male')
        }

        scope :female, -> {
            in_company.joins(Arel.sql("inner join custom_values on custom_values.customized_id = #{ self.table_name }.id"))
            .where("custom_values.custom_field_id = ?", CustomField.gender_custom_field_id)
            .where("custom_values.value = ?", 'female')
        }

        scope :andy, -> {
            in_company.joins(Arel.sql("inner join custom_values on custom_values.customized_id = #{ self.table_name }.id"))
            .where("custom_values.custom_field_id = ?", CustomField.gender_custom_field_id)
            .where("custom_values.value = ?", 'andy')
        }

        scope :for_age_range, -> min, max {
          User.active.in_company.for_age_range_custom(min,max)
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
      end
    end
  end
end
