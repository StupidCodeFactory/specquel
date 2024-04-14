# frozen_string_literal: true

RSpec.describe Specquel::Configuration do
  describe 'skip_migrations' do
    context 'when not set' do
      around do |example|
        Singleton.__init__(described_class)
        example.run
        Singleton.__init__(described_class)
      end

      it 'defaults to false' do
        expect(described_class.instance).not_to be_skip_migrations
      end
    end

    context 'when set' do
      around do |example|
        Singleton.__init__(described_class)
        example.run
        Singleton.__init__(described_class)
      end

      before do
        Specquel.configure { |config| config.skip_migrations = true }
      end

      it 'returns true' do
        expect(described_class.instance).to be_skip_migrations
      end
    end
  end
end
