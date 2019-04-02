json.extract! @training, :id, :title, :description, :price_per_hour, :location, :min_start_time, :max_end_time, :user_id
json.reviews @training.reviews do |review|
  json.extract! review, :id, :content, :rating
  json.date review.created_at.strftime("%m/%d/%y")
end
