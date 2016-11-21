module ActiveAdminMenu
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_initializer_file
        template "initializer.rb", "config/initializers/active_admin_menu.rb"
      end

      def copy_config_file
        template "active_admin_menu.yml", "config/active_admin_menu.yml"
      end
    end
  end
end
