class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :schedule
  has_many :reviews

  validates :start_time, :end_time, :total_price, presence: true
end
