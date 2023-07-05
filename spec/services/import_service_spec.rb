require 'rails_helper'

RSpec.describe ImportService, type: :service do
  let(:tenant) { create(:tenant) }
  let(:file) { fixture_file_upload('files/translations.po', 'text/plain') }

  describe '#import' do
    subject { described_class.new(tenant, file).import }

    context 'when file is valid' do
      it 'imports translations' do
        expect { subject }.to change { tenant.translations.count }.by(1)
      end

      it 'creates translations with correct attributes' do
        subject
        translation = tenant.translations.last
        expect(translation.source_language).to eq('en')
        expect(translation.target_languages).to include('fr', 'de')
      end
    end

    context 'when file is invalid' do
      let(:file) { fixture_file_upload('files/invalid.po', 'text/plain') }

      it 'raises an error' do
        expect { subject }.to raise_error(ImportService::InvalidFileError)
      end
    end
  end
end