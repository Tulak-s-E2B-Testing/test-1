class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :source_language, null: false, foreign_key: { to_table: :languages }
      t.text :source_text, null: false

      t.timestamps
    end

    create_table :translation_targets do |t|
      t.references :translation, null: false, foreign_key: true
      t.references :target_language, null: false, foreign_key: { to_table: :languages }
      t.text :target_text, null: false

      t.timestamps
    end
  end
end