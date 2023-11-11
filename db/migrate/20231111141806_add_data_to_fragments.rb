class AddDataToFragments < ActiveRecord::Migration[7.0]
  def change
    add_column :fragments, :published_at, :date
  end
end
