class RemoveTrainingFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bookings, :training, foreign_key: true
  end
end
