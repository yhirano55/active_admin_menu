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
      { parent: parent_i18n, label: label_i18n, priority: priority }.reject { |_, v| v.nil? }
    end

    private

    def parent_i18n
      return unless parent

      I18n.t([config.i18n_scope_prefix[:parent], parent.downcase].join("."), default: parent)
    end

    def label_i18n
      return unless is_page

      I18n.t([config.i18n_scope_prefix[:label], resource_name.downcase].join("."), default: resource_name)
    end

    def config
      @_config ||= ::ActiveAdminMenu.config
    end
  end
end
