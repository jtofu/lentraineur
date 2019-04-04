puts  "Destroying Reviews.."
Review.destroy_all if Rails.env.development?
puts  "Destroying Bookings.."
Booking.destroy_all if Rails.env.development?
puts  "Destroying Trainings.."
Training.destroy_all if Rails.env.development?
puts  "Destroying Users.."
User.destroy_all if Rails.env.development?


puts "Seeding users...."

5.times do
  User.create!(wechat_id: Faker::IDNumber.spanish_foreign_citizen_number, username: Faker::Internet.username, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

puts "Created new #{User.count} users."


puts "Seeding trainings..."

sports = %W(football tennis badminton boxing weightlifting cardio-training basketball volleyball)

locations = %w(Jingan FFC Xujiahui Pudong Minhang Gubei Hongqiao Huangpu)

suffixes = ["training with a semi-pro", "personal coaching", "crash course", "bootcamp"]

boxing = 'https://images.unsplash.com/photo-1495555687398-3f50d6e79e1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
basketball = 'https://images.unsplash.com/photo-1484482340112-e1e2682b4856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1655&q=80'
tennis = 'https://images.unsplash.com/photo-1545809074-59472b3f5ecc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
weightlifting = 'https://images.unsplash.com/photo-1526403646408-57b94dc15399?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'

default = 'https://images.unsplash.com/photo-1461897104016-0b3b00cc81ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80'

images = [boxing, basketball, tennis, weightlifting, default]

20.times do
  sport = sports.sample
  if sport == "boxing"
    image = boxing
  elsif sport == "basketball"
    image = basketball
  elsif sport == "tennis"
    image = tennis
  elsif sport == "weightlifting"
    image = weightlifting
  else
    image = default
  end

  training = Training.create!(title: "#{sport.capitalize} #{suffixes.sample} in #{locations.sample}", description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote, price_per_hour: (100..300).to_a.sample, location: locations.sample, user: User.all.sample, image: image)
  training.category_list.add(sport)
  training.save
end

puts "Created new #{Training.count} trainings."

sec_hr = 60 * 60

puts "Seeding bookings..."
Training.all.each do |training|
  5.times do
    b = Booking.new(user: User.all.sample, training: training)
    b.start_time = b.training.min_start_time
    b.end_time = b.start_time + (sec_hr * 2)
    b.total_price = b.training.price_per_hour * 2
    b.save
  end
end

puts "Created new #{Booking.count} bookings."

puts "Seeding reviews..."
ratings = [1,2,3,4,5]

Booking.all.each do |b|
  3.times do
    Review.create!(booking: b, content: Faker::Company.bs, rating: ratings.sample)
  end
end

puts "Created new #{Review.count} reviews"







