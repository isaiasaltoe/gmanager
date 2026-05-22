class Team < ApplicationRecord
  belongs_to :user, foreign_key: "creator_id"
  has_many :users, dependent: :nullify
end
