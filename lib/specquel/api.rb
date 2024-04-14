# frozen_string_literal: true

module Specquel
  module API
    NO_CONNECTION_ARGUMENTS_ERROR = <<-END_OF_ERROR
      Specquel expects a Specquel::Configuration#connection_arguments to be set

      Please configure specquel this way:

      Specquel.configure do |config|
        config.connection_arguments = "sqlite://test.db"
      end
    END_OF_ERROR

    def db
      @db ||= begin
        connection_arguments = Configuration.instance.connection_arguments
        unless connection_arguments.is_a?(Hash) || connection_arguments.is_a?(String)
          raise ArgumentError, NO_CONNECTION_ARGUMENTS_ERROR
        end

        Sequel.connect(Configuration.instance.connection_arguments)
      end
    end
    module_function :db
  end
end
