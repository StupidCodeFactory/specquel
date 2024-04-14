# frozen_string_literal: true

require 'specquel/version'
require 'sequel'
require 'singleton'
require 'specquel/configuration'
require 'specquel/api'

module Specquel
  class << self
    def run_migration!
      return unless Configuration.instance.run_migrations?

      Sequel.extension :migration

      # DB, '/path/to/migrations/dir', :use_transactions=>true
      Sequel::Migrator.run(
        API.db,
        Configuration.instance.migrations_folder,
        Configuration.instance.migration_extra_arguments
      )
    end

    def configure
      yield Configuration.instance
    end
  end
end

RSpec.configure do |config|
  config.include Specquel::API

  config.before(:suite) do
    Specquel.run_migration!
  end
end
