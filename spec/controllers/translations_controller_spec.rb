require 'rails_helper'

RSpec.describe TranslationsController, type: :controller do
  let(:tenant) { create(:tenant) }
  let(:translation) { create(:translation, tenant: tenant) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { tenant_id: tenant.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: translation.id, tenant_id: tenant.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { { source_language: 'en', target_language: 'fr', content: 'Hello', tenant_id: tenant.id } }

      it 'creates a new Translation' do
        expect {
          post :create, params: { translation: valid_attributes }
        }.to change(Translation, :count).by(1)
      end

      it 'redirects to the created translation' do
        post :create, params: { translation: valid_attributes }
        expect(response).to redirect_to(Translation.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { source_language: '', target_language: '', content: '', tenant_id: tenant.id } }

      it 'does not create a new Translation' do
        expect {
          post :create, params: { translation: invalid_attributes }
        }.not_to change(Translation, :count)
      end

      it 'returns a success response (i.e. to display the 'new' template)' do
        post :create, params: { translation: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { content: 'Bonjour' } }

      it 'updates the requested translation' do
        put :update, params: { id: translation.id, translation: new_attributes, tenant_id: tenant.id }
        translation.reload
        expect(translation.content).to eq('Bonjour')
      end

      it 'redirects to the translation' do
        put :update, params: { id: translation.id, translation: new_attributes, tenant_id: tenant.id }
        expect(response).to redirect_to(translation)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { { content: '' } }

      it 'does not update the translation' do
        put :update, params: { id: translation.id, translation: invalid_attributes, tenant_id: tenant.id }
        translation.reload
        expect(translation.content).not_to eq('')
      end

      it 'returns a success response (i.e. to display the 'edit' template)' do
        put :update, params: { id: translation.id, translation: invalid_attributes, tenant_id: tenant.id }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested translation' do
      translation = Translation.create! valid_attributes
      expect {
        delete :destroy, params: { id: translation.id, tenant_id: tenant.id }
      }.to change(Translation, :count).by(-1)
    end

    it 'redirects to the translations list' do
      delete :destroy, params: { id: translation.id, tenant_id: tenant.id }
      expect(response).to redirect_to(translations_url)
    end
  end
end