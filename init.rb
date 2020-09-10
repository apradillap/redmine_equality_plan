# frozen_string_literal: true

Redmine::Plugin.register :redmine_equality_plan do
  name 'Redmine Equality Plan plugin'
  author 'Adrián Pradilla y Carlos Castellanos'
  description 'Plugin for the diagnostic phase of an equality plan'
  version '0.0.1'
  url 'https://github.com/apradillap/redmine_equality_plan'
  author_url 'https://github.com/apradillap/redmine_equality_plan'
end

(Rails::VERSION::MAJOR < 5 ? ActionDispatch : ActiveSupport)::Reloader.to_prepare do
  User.include RedmineEqualityPlan::RedminePatch::UserPatch
  User.include RedmineEqualityPlan::RedminePatch::UserCustomPatch
  CustomField.include RedmineEqualityPlan::RedminePatch::CustomFieldPatch
end
