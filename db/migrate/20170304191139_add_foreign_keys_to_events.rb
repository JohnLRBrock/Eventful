class AddForeignKeysToEvents < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :events, :host_id
    add_foreign_key :events, :guest_id
  end
end
