class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_and_belongs_to_many :attendees, join_table: :invites, 
                       class_name: "User", association_foreign_key: "attendee_id"
end
