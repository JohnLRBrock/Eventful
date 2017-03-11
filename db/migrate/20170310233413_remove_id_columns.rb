class RemoveIdColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :invitations, :id
    remove_column :attendings,  :id
  end
end
