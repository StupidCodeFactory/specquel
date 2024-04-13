module Specquel
  class Configuration
    include Singleton
    attr_accessor :connection_arguments, :migrations_folder, :run_migrations

    def initialize
      self.run_migrations = true
    end

    def run_migrations?
      run_migrations
    end
  end
end
