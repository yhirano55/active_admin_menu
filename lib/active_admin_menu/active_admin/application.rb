module ActiveAdminMenu
  module ActiveAdmin
    module Application
      def register(*arg, &block)
        super(*arg) do
          allocate_to_menu
          instance_eval(&block)
        end
      end

      def register_page(*args, &block)
        super(*args) do
          allocate_to_menu(is_page: true)
          instance_eval(&block)
        end
      end
    end
  end
end
