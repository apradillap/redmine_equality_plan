module RedmineEqualityPlan
  module RedminePatch
    module UserCustomPatch
      def self.included(base)
        base.class_eval do
          scope :in_company_custom, proc {
            User.where(type: 'User').where("id IN (SELECT gu.user_id FROM groups_users gu WHERE gu.group_id = 42)")
          }
        end
      end
    end
  end
end
