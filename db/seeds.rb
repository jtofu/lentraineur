Review.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?
Training.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?


puts "Seeding users...."

5.times do
  User.create!(wechat_id: Faker::IDNumber.spanish_foreign_citizen_number, username: Faker::Internet.username)
end

puts "Created new #{User.count} users."


puts "Seeding trainings..."

sports = %W(football tennis badminton thai-boxing brazilian-jiujitsu marathon triathlon weight-lifting hiit cardio-training basketball volleyball)

locations = %w(Jingan FFC Xujiahui Pudong Minhang Gubei Hongqiao Huangpu)

suffixes = ["training with a semi-pro", "personal coaching", "crash course", "bootcamp"]

20.times do
  training = Training.create!(title: "#{sports.sample} #{suffixes.sample} in #{locations.sample}", description: Faker::Quotes::Shakespeare.romeo_and_juliet_quote, price_per_hour: (100..300).to_a.sample, location: locations.sample, min_start_time: Faker::Date.between(2.days.ago, Date.today), max_end_time: Faker::Date.between(Date.today, 5.days.from_now), user: User.all.sample)
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


