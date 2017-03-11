class DropInvitesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :invites
  end
end
