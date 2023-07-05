```ruby
namespace :export do
  desc "Export translations to GetText and YAML files"
  task :translations => :environment do
    Tenant.all.each do |tenant|
      ExportService.new(tenant).perform
    end
  end
end
```