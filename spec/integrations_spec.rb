# frozen_string_literal: true

RSpec.describe 'Integrations' do
  around do |example|
    Dir.chdir(File.join(Dir.pwd, 'spec/fixtures/specquel_integration_test')) do
      example.run
    end
  end

  it 'runs sucessfully with minimal confifuration' do
    expect { system('bundle exec rspec') }.to output(/2 examples, 0 failures/).to_stdout_from_any_process
  end
end
