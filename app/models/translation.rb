```ruby
class Translation < ApplicationRecord
  belongs_to :tenant
  belongs_to :source_language, class_name: 'Language'
  has_many :target_languages, class_name: 'Language'

  validates :source_text, presence: true
  validates :target_text, presence: true

  def to_gettext
    "#{source_text}\nmsgid \"#{source_text}\"\nmsgstr \"#{target_text}\""
  end

  def to_yaml
    {
      source_language.code => { source_text => target_text }
    }.to_yaml
  end
end
```