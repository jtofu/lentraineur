json.bookings do
  json.array! do |booking|
    json.extract! booking, :id, :reviews, :user_id, :training_id, :start_time, :end_time, :total_price
  end
end
