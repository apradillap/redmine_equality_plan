module RedmineEqualityPlan
  module RedminePatch
    module UserPatch
      def self.included(base)
        base.class_eval do
          def gender
            d = GenderDetector.new

            d.get_gender(self.firstname, :spain).to_s
          end
        end
      end
    end
  end
end
RedmineExtensions::PatchManager.register_model_patch 'User', 'RedmineEqualityPlan::RedminePatch::UserPatch'
