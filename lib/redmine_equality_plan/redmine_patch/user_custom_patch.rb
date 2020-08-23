module RedmineEqualityPlan
  module RedminePatch
    module UserCustomPatch
      User.class_eval do
        scope :in_company_custom, proc {
          # Define your custom scope
          User.all
          # Group.find(42).users
        }
      end
    end
  end
end
