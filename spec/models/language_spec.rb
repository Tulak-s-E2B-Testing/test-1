require 'rails_helper'

RSpec.describe Language, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:translations) }

  describe '#name' do
    it 'should not be blank' do
      language = Language.new(name: '')
      expect(language.valid?).to be_falsey
    end

    it 'should be unique' do
      Language.create!(name: 'English')
      language = Language.new(name: 'English')
      expect(language.valid?).to be_falsey
    end
  end

  describe '#translations' do
    it 'should be able to have multiple translations' do
      language = Language.create!(name: 'English')
      translation1 = Translation.create!(source: 'Hello', target: 'Hola', language: language)
      translation2 = Translation.create!(source: 'Goodbye', target: 'Adios', language: language)
      expect(language.translations).to include(translation1, translation2)
    end
  end
end