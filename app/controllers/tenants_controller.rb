```ruby
class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]

  def index
    @tenants = Tenant.all
  end

  def show
  end

  def new
    @tenant = Tenant.new
  end

  def edit
  end

  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      redirect_to @tenant, notice: 'Tenant was successfully created.'
    else
      render :new
    end
  end

  def update
    if @tenant.update(tenant_params)
      redirect_to @tenant, notice: 'Tenant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tenant.destroy
    redirect_to tenants_url, notice: 'Tenant was successfully destroyed.'
  end

  private
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    def tenant_params
      params.require(:tenant).permit(:name)
    end
end
```