module Imports
  describe Employees do
    describe '#run' do
      subject(:importer) { described_class.new(file_path).run }

      let(:file_path) { Rails.root.join('spec/fixtures/employees.csv') }

      # your tests go here...
    end
  end
end
