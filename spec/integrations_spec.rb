RSpec.describe "Integration test" do

  around do |example|
    Dir.chdir(File.join(Dir.pwd, 'spec/fixtures/specquel_integration_test')) do
      example.run
    end
  end

  it "runs sucessfully with minimal confifuration" do
    expect(system('bundle exec rspec')).to output(/2 example, 0 failures/).to_stdout
  end
end
