module Specquel
  class Configuration
    include Singleton
    attr_accessor :connection_arguments
  end
end
