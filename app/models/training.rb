class Training < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, :price_per_hour, :location, presence: true
  validates :price_per_hour, numericality: { only_integer: true }

  acts_as_taggable_on :categories
end


