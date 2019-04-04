json.schedules do
  json.array! @schedules do |schedule|
    json.extract! schedule, :id, :start_time, :end_time, :bookings
  end
end
