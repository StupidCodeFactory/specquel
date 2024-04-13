# frozen_string_literal: true

RSpec.describe SpecquelIntergrationTests do
  let(:tenderlove) { 'Aaron Patterson' }

  before do
    db[:users].insert(name: tenderlove)
  end

  it "fetches records from the database" do
    expect(db[:users].to_a).to match([id: an_instance_of(Integer), name: tenderlove])
  end
end
