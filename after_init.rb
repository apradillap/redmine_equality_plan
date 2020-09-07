# frozen_string_literal: true

# Dir[File.dirname(__FILE__) + '/lib/redmine_equality_plan/redmine_patch/**/*.rb'].each { |file| require_dependency file }

lib_dir = File.join(File.dirname(__FILE__), 'lib', 'redmine_equality_plan')

# Redmine patches
patch_path = File.join(lib_dir, 'redmine_patch', '**', '*.rb')
Dir.glob(patch_path).each do |file|
  require file
end
