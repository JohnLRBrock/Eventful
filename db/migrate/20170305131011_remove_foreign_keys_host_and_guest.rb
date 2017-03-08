class RemoveForeignKeysHostAndGuest < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :events, :host_id
    remove_foreign_key :events, :guest_id
  end
end
