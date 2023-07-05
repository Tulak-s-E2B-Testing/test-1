require 'rails_helper'

RSpec.describe ExportService, type: :service do
  let(:tenant) { create(:tenant) }
  let(:source_language) { create(:language, code: 'en') }
  let(:target_language) { create(:language, code: 'fr') }
  let(:translation) { create(:translation, tenant: tenant, source_language: source_language, target_language: target_language) }

  describe '#export_to_gettext' do
    it 'exports translations to GetText format' do
      service = ExportService.new(tenant)
      expect(service.export_to_gettext).to include(translation.key)
    end
  end

  describe '#export_to_yaml' do
    it 'exports translations to YAML format' do
      service = ExportService.new(tenant)
      yaml_output = service.export_to_yaml
      expect(YAML.load(yaml_output)[translation.key]).to eq(translation.value)
    end
  end
end