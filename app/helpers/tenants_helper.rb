module TenantsHelper
  def tenant_languages(tenant)
    tenant.languages.map(&:name).join(', ')
  end
end