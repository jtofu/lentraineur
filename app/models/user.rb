class User < ApplicationRecord
  has_many :trainings
  has_many :bookings

  validates :wechat_id, presence: true, uniqueness: true
end
