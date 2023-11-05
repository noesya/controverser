class CreateControversies < ActiveRecord::Migration[7.0]
  def change
    create_table :controversies do |t|
      t.string :name
      t.text :text
      t.string :slug

      t.timestamps
    end
  end
end
