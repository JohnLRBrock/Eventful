class DropAttendingsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :attendings
  end
end
