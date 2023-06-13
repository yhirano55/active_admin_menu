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
      @source = value.is_a?(Hash) ? value : load_yaml_file(value)
    end

    def namespaced_source
      source[namespace] || source
    end

    private

    def load_yaml_file(file_name)
      text = File.read(file_name)
      YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(text) : YAML.load(text)
    end
  end
end
