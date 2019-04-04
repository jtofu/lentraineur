class User < ApplicationRecord
  has_many :trainings
  has_many :schedules, through: :trainings
  # Trainer's bookings
  has_many :bookings, through: :schedules

  # Trainee's bookings
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :wechat_id, presence: true, uniqueness: true
end
