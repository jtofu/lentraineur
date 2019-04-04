json.extract! @training, :id, :title, :description, :price_per_hour, :location, :user_id,  :image, :schedules
json.reviews @reviews do |review|
  json.extract! review, :id, :content, :rating
end

