# frozen_string_literal: true

RSpec.describe SpecquelIntegrationTest do
  describe 'with the specquel' do
    it 'is able to access a sequel connection with a minimum amount of effort and configuration' do
      expect(db.select(1).get("1")).to eq("1")
    end

    context 'when the project has migration' do
      let(:tenderlove) { 'Aaron Patterson' }

      before do
        db[:users].insert({name: tenderlove})
      end

      it 'runs the migrations and allows me to select records from the migrated tables' do
        expect(db[:users].to_a).to match(id: an_instance_of(Integer), name: tenderlove)
      end
    end
  end
end
