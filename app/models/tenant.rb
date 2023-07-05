```ruby
class Tenant < ApplicationRecord
  has_many :translations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
```