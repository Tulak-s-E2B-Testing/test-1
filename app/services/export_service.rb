```ruby
class ExportService
  require 'gettext/utils'

  def initialize(tenant)
    @tenant = tenant
  end

  def export_to_gettext
    translations = @tenant.translations
    translations.each do |translation|
      GetText::RGetText.add(translation.source_language, translation.target_languages)
    end
    GetText::RGetText.generate
  end

  def export_to_yaml
    translations = @tenant.translations
    translations.each do |translation|
      I18n.backend.store_translations(translation.source_language, translation.target_languages)
    end
    I18n.backend.to_yaml
  end
end
```