class Schedule < ApplicationRecord
  belongs_to :training
  has_many :bookings

  validates :start_time, uniqueness: { scope: :end_time }
end
