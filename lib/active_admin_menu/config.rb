require "yaml"

module ActiveAdminMenu
  class << self
    def configure
      yield(config)
    end

    def config
      @_config ||= Config.new
    end
  end

  class Config
    attr_reader :source
    attr_accessor :namespace, :uncategorize_key_name, :i18n_scope_prefix

    def initialize
      @source                = {}
      @uncategorize_key_name = "root"
      @i18n_scope_prefix     = { parent: "active_admin.menu", label: "active_admin.menu" }
    end

    def source=(value)
      @source = value.is_a?(Hash) ? value : YAML.load_file(value.to_s)
    end

    def namespaced_source
      source[namespace] || source
    end
  end
end
