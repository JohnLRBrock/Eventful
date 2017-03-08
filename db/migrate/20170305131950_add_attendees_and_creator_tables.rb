class AddAttendeesAndCreatorTables < ActiveRecord::Migration[5.0]
  def change
    create_table :creators, id: false do |t|
      t.integer :creator_id
      t.integer :event_id
    end

    create_table :attendees, id: false do |t|
      t.integer :attendee_id
      t.integer :event_id
    end
  end
end
