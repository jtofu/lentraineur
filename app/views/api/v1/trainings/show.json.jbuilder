json.extract! @training, :id, :title, :description, :price_per_hour, :location, :user_id,  :image, :category_list

json.schedules @training.schedules do |schedule|
  json.extract! schedule, :id
  json.start_time schedule.start_time.strftime("%A, %d %b %Y %l:%M %p")
  json.end_time schedule.end_time.strftime("%A, %d %b %Y %l:%M %p")
end

json.reviews @reviews do |review|
  json.extract! review, :id, :content, :rating
end

