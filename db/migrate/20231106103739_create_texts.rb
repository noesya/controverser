class CreateTexts < ActiveRecord::Migration[7.0]
  def change
    create_table :texts do |t|
      t.string :title
      t.string :slug
      t.text :image
      t.text :full_text
      t.text :summary_short
      t.text :summary_long
      t.text :url
      t.text :source
      t.references :controversy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
