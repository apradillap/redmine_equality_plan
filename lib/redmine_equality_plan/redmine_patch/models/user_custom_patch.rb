module RedmineEqualityPlan
  module RedminePatch
    module UserCustomPatch
      User.class_eval do
        after_save :define_gender

        scope :in_company_custom, proc {
          # Define your custom scope
          # User.all
          Group.find(42).users
        }

        scope :for_age_range_custom, -> min, max {
          where("users.id IN (SELECT u.assigned_to_id FROM issues u WHERE u.id IN
                             (SELECT f.customized_id FROM custom_values f WHERE f.custom_field_id=? AND
                              date_part('year', age(TO_DATE(f.value, 'YYYY-MM-DD'))) >= ? AND
                              date_part('year', age(TO_DATE(f.value, 'YYYY-MM-DD'))) <= ?))",
                              YAML.load_file('plugins/redmine_equality_plan/config/configuration.yml')['birthday_custom_field_id'], min, max)
        }

        scope :for_contract_date_range_custom, -> min, max {
          where("users.id IN (SELECT u.assigned_to_id FROM issues u WHERE u.id IN
                             (SELECT f.customized_id FROM custom_values f WHERE f.custom_field_id=? AND
                              date_part('year', age(TO_DATE(f.value, 'YYYY-MM-DD'))) >= ? AND
                              date_part('year', age(TO_DATE(f.value, 'YYYY-MM-DD'))) <= ?))",
                              YAML.load_file('plugins/redmine_equality_plan/config/configuration.yml')['contract_start_date_custom_field_id'], min, max)
        }

        def self.custom_contract_types(users)
          user_ids = users.in_company_custom.map(&:id)
          issue_ids = Issue.where("project_id=418 AND assigned_to_id IN (#{user_ids.join(',')})").map(&:id)
          CustomValue.where("custom_field_id=162 AND customized_type='Issue' AND customized_id IN (#{issue_ids.join(',')})").group(:value).count
        end

      end
    end
  end
end

User.include RedmineEqualityPlan::RedminePatch::UserCustomPatch
