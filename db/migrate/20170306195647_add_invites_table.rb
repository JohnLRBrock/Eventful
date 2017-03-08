class AddInvitesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :invites, id: false do |t|
      t.integer :attendee_id
      t.integer :event_id

      t.timestamp
    end
  end
end
