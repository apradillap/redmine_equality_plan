Redmine::Plugin.register :redmine_equality_plan do
  name 'Redmine Equality Plan plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

(Rails::VERSION::MAJOR < 5 ? ActionDispatch : ActiveSupport)::Reloader.to_prepare do
  User.include RedmineEqualityPlan::RedminePatch::UserPatch
  User.include RedmineEqualityPlan::RedminePatch::UserCustomPatch
  CustomField.include RedmineEqualityPlan::RedminePatch::CustomFieldPatch
end
