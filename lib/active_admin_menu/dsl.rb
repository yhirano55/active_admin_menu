module ActiveAdminMenu
  module DSL
    def allocate_to_menu(is_page: false)
      if item = active_admin_menu.find_item_by(resource_name: config.resource_name.name)
        item.is_page = is_page
        menu(item.to_options)
      else
        menu(if: -> { false })
      end
    end

    private

    def active_admin_menu
      @_active_admin_menu ||= ::ActiveAdminMenu::Menu.build
    end
  end
end
