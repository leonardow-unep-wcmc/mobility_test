class CreatePostTitleAndContentTranslationsForMobilityTableBackend < ActiveRecord::Migration[7.0]
  def change
    create_table :post_translations do |t|

      # Translated attribute(s)
      t.string :title
      t.text :content

      t.string  :locale, null: false
      t.references :post, null: false, foreign_key: true, index: false

      t.timestamps null: false
    end

    add_index :post_translations, :locale, name: :index_post_translations_on_locale
    add_index :post_translations, [:post_id, :locale], name: :index_post_translations_on_post_id_and_locale, unique: true

  end
end
