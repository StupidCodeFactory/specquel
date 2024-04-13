# frozen_string_literal: true

require "specquel_intergration_tests"
require "specquel"

Specquel.configure do |config|
  config.connection_arguments = "sqlite://test.db"
  config.migrations_folder = "db/migrate"
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before do
    db[:users].truncate
  end
end
