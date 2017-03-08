class DropCreatorsAndAttendeesTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :creators
    drop_table :attendees
  end
end
