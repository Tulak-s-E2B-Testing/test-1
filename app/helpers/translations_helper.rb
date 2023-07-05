module TranslationsHelper
  def format_languages(languages)
    languages.map(&:name).join(', ')
  end

  def format_translation(translation)
    "#{translation.source_language.name} -> #{format_languages(translation.target_languages)}"
  end
end