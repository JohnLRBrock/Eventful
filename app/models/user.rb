class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id"
  has_and_belongs_to_many :invitations,  class_name: "Event", join_table: "invitations"
  has_and_belongs_to_many :attendings, class_name: "Event", join_table: "attendings"
end
