json.extract! @user, :id, :wechat_id, :username, :profile_image, :first_name, :last_name
json.trainings @user.trainings do |training|
  json.extract! training, :id, :title, :description, :price_per_hour, :location, :image
end
