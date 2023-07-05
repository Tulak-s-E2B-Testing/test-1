require 'rails_helper'

RSpec.describe TenantsController, type: :controller do
  let(:valid_attributes) {
    { name: 'Tenant1' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      Tenant.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      tenant = Tenant.create! valid_attributes
      get :show, params: {id: tenant.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tenant" do
        expect {
          post :create, params: {tenant: valid_attributes}
        }.to change(Tenant, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a new Tenant" do
        expect {
          post :create, params: {tenant: invalid_attributes}
        }.to change(Tenant, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'Tenant2' }
      }

      it "updates the requested tenant" do
        tenant = Tenant.create! valid_attributes
        put :update, params: {id: tenant.to_param, tenant: new_attributes}
        tenant.reload
        expect(tenant.name).to eq('Tenant2')
      end
    end

    context "with invalid params" do
      it "does not update the tenant" do
        tenant = Tenant.create! valid_attributes
        put :update, params: {id: tenant.to_param, tenant: invalid_attributes}
        tenant.reload
        expect(tenant.name).to eq('Tenant1')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested tenant" do
      tenant = Tenant.create! valid_attributes
      expect {
        delete :destroy, params: {id: tenant.to_param}
      }.to change(Tenant, :count).by(-1)
    end
  end
end