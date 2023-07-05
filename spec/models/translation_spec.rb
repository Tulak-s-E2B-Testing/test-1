require 'rails_helper'

RSpec.describe Translation, type: :model do
  it { should belong_to(:tenant) }
  it { should belong_to(:source_language).class_name('Language') }
  it { should have_many(:target_languages).class_name('Language') }

  it { should validate_presence_of(:source_text) }

  describe '#export_to_gettext' do
    let(:translation) { create(:translation) }

    it 'exports the translation to GetText format' do
      expect(translation.export_to_gettext).to match(/msgid "#{translation.source_text}"/)
    end
  end

  describe '#export_to_yaml' do
    let(:translation) { create(:translation) }

    it 'exports the translation to YAML format' do
      expect(YAML.load(translation.export_to_yaml)).to include('en' => { 'translations' => { translation.source_text => translation.target_text } })
    end
  end
end