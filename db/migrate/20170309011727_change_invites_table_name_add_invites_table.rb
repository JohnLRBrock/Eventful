class ChangeInvitesTableNameAddInvitesTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :invites, :attendings
    create_join_table :users, :events, table_name: :invites do |t|
      t.index :invitee_id
      t.index :event_id
    end
  end
end
