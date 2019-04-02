json.reviews do
  json.array! @reviews do |review|
    json.extract! review, :id, :content, :rating, :booking_id
  end
end
