require "rails"

module ActiveAdminMenu
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      ActiveAdmin::DSL.send :include, ActiveAdminMenu::DSL
      ActiveAdmin::Application.send :prepend, ActiveAdminMenu::Allocator
    end
  end
end
