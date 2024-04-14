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
  end
end

RSpec.configure do |config|
  config.include Specquel::API
end
