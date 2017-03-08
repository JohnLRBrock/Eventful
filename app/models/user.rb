class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id"
  has_and_belongs_to_many :event_invitations, join_table: :invites, 
                                              class_name: "Event",
                                              foreign_key: "event_id"
end
