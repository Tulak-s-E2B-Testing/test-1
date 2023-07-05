```ruby
require 'gettext_i18n_rails'

FastGettext.add_text_domain 'app', :path => 'locale', :type => :po
FastGettext.default_text_domain = 'app'
FastGettext.default_available_locales = ['en', 'other_languages'] #all other locales are not available by default

GettextI18nRails.translations_are_html_safe = true

include FastGettext::Translation
```