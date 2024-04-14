# frozen_string_literal: true

require 'specquel/version'
require 'sequel'
require 'singleton'
require 'specquel/api'
require 'specquel/configuration'

module Specquel
  class << self
    def configure
      yield Configuration.instance
    end

    def config
      Configuration.instance
    end

    def run_migrations!
      return if config.skip_migrations?

      Sequel.extension :migration
      Sequel::Migrator.run(Specquel::API.db, Specquel.config.migrations_folder)
    end
  end
end

RSpec.configure do |config|
  config.include Specquel::API

  config.before(:suite) do
    Specquel.run_migrations!
  end
end
