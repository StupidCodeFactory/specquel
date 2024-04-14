# frozen_string_literal: true

module Specquel
  class Configuration
    include Singleton
    attr_accessor :connection_arguments, :migrations_folder, :skip_migrations

    def initialize
      self.skip_migrations = false
    end

    def skip_migrations?
      skip_migrations
    end
  end
end
