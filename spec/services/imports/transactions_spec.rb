module Imports
  describe Transactions do
    describe '#run' do
      subject(:importer) { described_class.new(file_path).run }

      let(:file_path) { Rails.root.join('spec/fixtures/transactions.csv') }

    end
  end
end
