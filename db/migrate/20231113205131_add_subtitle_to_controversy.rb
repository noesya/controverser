class AddSubtitleToControversy < ActiveRecord::Migration[7.0]
  def change
    add_column :controversies, :subtitle, :string
  end
end
