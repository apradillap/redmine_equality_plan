# Dir[File.dirname(__FILE__) + '/lib/redmine_equality_plan/redmine_patch/**/*.rb'].each { |file| require_dependency file }

lib_dir = File.join(File.dirname(__FILE__), 'lib', 'redmine_equality_plan')

Redmine::MenuManager.map :top_menu do |menu|
  menu.push :equality_plan,
            { controller: 'equality_plans', action: 'index' },
            caption: :label_plugin_equality_plan,
            html: { class: 'icon icon-group easy-contacts' },
            if: proc { User.current.allowed_to?(:equality_plan, nil, global: true) },
            last: true
end

ActiveSupport.on_load(:easyproject, yield: true) do
  Redmine::AccessControl.map do |map|
    map.project_module :easy_other_permissions do |pmap|
      pmap.permission :equality_plan, { equality_plans: %i[index] }, global: true
    end
  end
end

# Redmine patches
patch_path = File.join(lib_dir, 'redmine_patch', '**', '*.rb')
Dir.glob(patch_path).each do |file|
  require file
end
