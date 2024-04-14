RSpec.describe Specquel::Configuration do
  around do |example|
    Singleton.__init__(described_class)
    example.run
    Singleton.__init__(described_class)
  end

  describe '#run_migrations' do
    context 'when no set' do
      it 'defaults to true' do
        expect(described_class.instance.run_migrations).to eq(true)
      end
    end

    context 'when set to false' do
      before do
        Specquel.configure { |config| config.run_migrations = false }
      end

      it 'returns false' do
        expect(described_class.instance.run_migrations).to eq(false)
      end
    end
  end
end
