require_relative 'require.rb'

module System
  # Public: App class. Home for things like path, arguments, and kicks off
  # other system services
  class App
    class << self
      def call(args)
        System::Require.new.call

        # Default app service. we'll override this so it's configurable later
        Services::Process.new.call(args)
      end

      # Public: Convenience method that returns the project root path
      def root
        Dir.pwd
      end
    end
  end
end

# Alias App for convenience
App = System::App
