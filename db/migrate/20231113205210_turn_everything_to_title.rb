class TurnEverythingToTitle < ActiveRecord::Migration[7.0]
  def change
    rename_column :controversies, :name, :title
    rename_column :concepts, :name, :title
  end
end
