module ActiveAdminMenu
  class Menu
    attr_reader :items

    def initialize
      @items = []
    end

    def find_item_by(resource_name:)
      items.detect { |item| item.resource_name == resource_name }
    end

    def add(resource_name:, parent: nil)
      items << Item.new(resource_name: resource_name, parent: parent, priority: items.length + 1)
    end

    class << self
      def build
        new.tap do |menu|
          namespaced_source.each do |key, resource_names|
            parent = key == uncategorize_key_name ? nil : key
            resource_names.each do |resource_name|
              menu.add(resource_name: resource_name, parent: parent)
            end
          end
        end
      end

      private

      def namespaced_source
        config.namespaced_source
      end

      def uncategorize_key_name
        config.uncategorize_key_name
      end

      def config
        @_config ||= ::ActiveAdminMenu.config
      end
    end
  end
end
