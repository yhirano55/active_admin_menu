module ActiveAdminMenu
  class Item
    attr_reader :resource_name, :parent, :priority
    attr_accessor :is_page

    def initialize(resource_name:, parent:, priority:)
      @resource_name = resource_name
      @parent = parent
      @priority = priority
    end

    def to_options
      { priority: priority }.tap do |options|
        options.store(:parent, I18n.t(parent_i18n_scope, default: parent)) if parent
        options.store(:label, I18n.t(label_i18n_scope, default: resource_name)) if is_page
      end
    end

    private

    def parent_i18n_scope
      [config.i18n_scope_prefix[:parent], parent.downcase].join(".")
    end

    def label_i18n_scope
      [config.i18n_scope_prefix[:label], resource_name.downcase].join(".")
    end

    def config
      @_config ||= ::ActiveAdminMenu.config
    end
  end
end
