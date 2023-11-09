class AddJoinTableFragmentsConcepts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :fragments, :concepts
  end
end
