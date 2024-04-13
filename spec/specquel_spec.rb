# frozen_string_literal: true

RSpec.describe Specquel do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe 'when required' do
    around do |example|
      Singleton.__init__(described_class::Configuration)
      example.run
      Singleton.__init__(described_class::Configuration)
    end

    context 'when the #connection_arguments is set' do
      before do
        described_class.configure do |config|
          config.connection_arguments = 'sqlite://test.db'
        end
      end

      it 'allows to query a database' do
        expect { db.select(1).to_a }.not_to raise_error
      end
    end

    context 'when the #connection_arguments is not set' do
      it 'raises a useful error' do
        expect { db }.to raise_error ArgumentError, described_class::API::NO_CONNECTION_ARGUMENTS_ERROR
      end
    end
  end
end
