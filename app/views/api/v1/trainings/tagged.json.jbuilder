json.trainings do
  json.array! @trainings do |training|
    json.extract! training, :id, :title, :description, :price_per_hour, :location, :min_start_time, :max_end_time, :user_id
  end
end
