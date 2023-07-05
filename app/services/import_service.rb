```ruby
class ImportService
  require 'gettext/utils'

  def initialize(file, tenant_id)
    @file = file
    @tenant_id = tenant_id
  end

  def import
    begin
      ActiveRecord::Base.transaction do
        po = GetText::PoParser.parse(File.read(@file))
        po.each do |entry|
          source_language = Language.find_or_create_by(name: entry.msgid, tenant_id: @tenant_id)
          entry.msgstr.each_with_index do |msgstr, index|
            target_language = Language.find_or_create_by(name: po.header.language[index], tenant_id: @tenant_id)
            Translation.find_or_create_by(source_language: source_language, target_language: target_language, content: msgstr, tenant_id: @tenant_id)
          end
        end
      end
      true
    rescue => e
      false
    end
  end
end
```