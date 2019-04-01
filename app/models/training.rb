class Training < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, :price_per_hour, :location, :min_start_time, :max_end_time, presence: true
  validates :price_per_hour, numericality: { only_integer: true }
end
