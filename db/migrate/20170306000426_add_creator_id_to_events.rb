class AddCreatorIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :creator_id, :integer
  end

  add_index :events, :creator_id
end