json.trainings do
  json.array! @trainings do |training|
    json.extract! training, :id, :title, :description, :price_per_hour, :location, :user_id, :image
    json.schedules training.schedules do
      json.array! do |schedule|
        json.extract! :id, :start_time, :end_time
      end
    end
  end
end
