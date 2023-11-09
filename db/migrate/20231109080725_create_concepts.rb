class CreateConcepts < ActiveRecord::Migration[7.0]
  def change
    create_table :concepts do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.references :controversy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
