RSpec.describe 'Integration test' do
  around do |example|
    Dir.chdir(File.join(Dir.pwd, 'spec/fixtures/specquel_intergration_tests')) do
      example.run
    end
  end

  it 'runs the test suite containing a migration successfully' do
    expect { system('bundle exec rspec') }.to output(/1 example, 0 failures/).to_stdout_from_any_process
  end
end
