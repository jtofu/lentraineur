class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :training, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :total_price

      t.timestamps
    end
  end
end
