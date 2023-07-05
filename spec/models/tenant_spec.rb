require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:translations) }

  describe '#translations_count' do
    let(:tenant) { create(:tenant) }

    before do
      create_list(:translation, 3, tenant: tenant)
    end

    it 'returns the count of translations' do
      expect(tenant.translations_count).to eq(3)
    end
  end
end