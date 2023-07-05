# db/seeds.rb

# Create some initial tenants
Tenant.create!([
  { name: 'Tenant 1' },
  { name: 'Tenant 2' },
  { name: 'Tenant 3' }
])

# Create some initial languages
Language.create!([
  { code: 'en', name: 'English' },
  { code: 'fr', name: 'French' },
  { code: 'de', name: 'German' }
])

# Create some initial translations for each tenant
Tenant.all.each do |tenant|
  Language.all.each do |language|
    Translation.create!(
      tenant: tenant,
      source_language: Language.find_by(code: 'en'),
      target_language: language,
      key: 'hello',
      value: 'Hello'
    )
  end
end