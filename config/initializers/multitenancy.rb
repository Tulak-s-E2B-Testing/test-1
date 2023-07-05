```ruby
# config/initializers/multitenancy.rb

module Multitenancy
  extend ActiveSupport::Concern

  included do
    before_action :set_current_tenant
  end

  private

  def set_current_tenant
    Tenant.current_id = session[:current_tenant_id]
  end
end

class Tenant < ActiveRecord::Base
  cattr_accessor :current_id
end
```