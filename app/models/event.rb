class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_and_belongs_to_many :invitees,  class_name: "User", join_table: "invitations"
  has_and_belongs_to_many :attendees, class_name: "User", join_table: "attendings"
  scope :past_events,   -> { where("datetime < ?",  Time.now) }
  scope :future_events, -> { where("datetime >= ?", Time.now) }
end
