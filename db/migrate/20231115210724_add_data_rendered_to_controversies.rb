class AddDataRenderedToControversies < ActiveRecord::Migration[7.0]
  def change
    add_column :controversies, :data_rendered, :text
  end
end
