class AddChatgptToFragments < ActiveRecord::Migration[7.0]
  def change
    add_column :fragments, :analyzed_on, :datetime
    add_column :fragments, :analyze_answer, :text
    add_column :fragments, :analyzed, :boolean
  end
end
