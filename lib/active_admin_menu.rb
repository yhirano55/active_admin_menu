require "active_admin"
require "active_admin_menu/config"
require "active_admin_menu/item"
require "active_admin_menu/menu"
require "active_admin_menu/active_admin/application"
require "active_admin_menu/active_admin/dsl"

::ActiveAdmin::DSL.send :include, ActiveAdminMenu::ActiveAdmin::DSL
::ActiveAdmin::Application.send :prepend, ActiveAdminMenu::ActiveAdmin::Application
