module RedmineEqualityPlan
  module RedminePatch
    module CustomFieldPatch
      CustomField.class_eval do
        def self.gender_custom_field_id
          YAML.load_file('plugins/redmine_equality_plan/config/configuration.yml')['gender_custom_field_id']
        end

        def gender_custom_field
          self.find_by(custom_field_id: self.gender_custom_field_id)
        end
      end
    end
  end
end
