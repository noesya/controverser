class RenameTextToFragment < ActiveRecord::Migration[7.0]
  def change
    rename_table :texts, :fragments
  end
end
