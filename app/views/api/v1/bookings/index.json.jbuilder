json.extract! @user, :id, :trainings, :bookings, :wechat_id, :username
json.bookings @user.bookings do
  json.array! do |booking|
    json.extract! booking, :id, :reviews, :user_id, :training_id, :start_time, :end_time, :total_price
    json.date review.created_at.strftime("%m/%d/%y")
  end
end
