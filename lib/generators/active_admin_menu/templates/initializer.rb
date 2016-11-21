ActiveAdminMenu.configure do |config|
  config.source                     = Rails.root.join("config", "active_admin_menu.yml")
  config.namespace                  = Rails.env
  config.uncategorize_key_name      = "root"
  config.i18n_scope_prefix[:parent] = "active_admin.menu"
  config.i18n_scope_prefix[:label]  = "active_admin.menu"
end
