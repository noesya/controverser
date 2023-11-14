class AddDataToControversy < ActiveRecord::Migration[7.0]
  def change
    add_column :controversies, :data, :jsonb, default: { blocks: [] }
  end
end
