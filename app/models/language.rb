```ruby
class Language < ApplicationRecord
  has_many :source_translations, class_name: 'Translation', foreign_key: 'source_language_id'
  has_many :target_translations, class_name: 'Translation', foreign_key: 'target_language_id'

  validates :name, presence: true, uniqueness: true
end
```