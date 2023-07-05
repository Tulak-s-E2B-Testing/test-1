```ruby
namespace :import do
  desc "Import translations from GetText and YAML files"
  task :translations => :environment do
    require 'import_service'

    Tenant.all.each do |tenant|
      ImportService.new(tenant).import_translations
    end
  end
end
```