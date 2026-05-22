class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  has_one :created_team, class_name: 'Team', foreign_key: 'creator_id', dependent: :destroy
  belongs_to :team, optional: true
end
