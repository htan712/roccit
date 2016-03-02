require "random_data"

rave = Topic.create!(name:  "Upcoming Rave Events", description:  "Share upcoming rave events and tickets with fellow ravers.")
fitness = Topic.create!(name:  "Health and Workout Tips", description:  "Share and help improve others active lifestyles.")
coooking = Topic.create!(name:  "Cooking recipes, homemade", description:  "Share your tricks&tips on delicious food.")
topics = Topic.all

admin = User.create!(
  name: 'Hockster',
  email: 'jtan712@bloc.com',
  password: 'helloworld',
  role: 'admin'
)

member = User.create!(
  name: 'Natalee',
  email: 'jtan712@gmail.com',
  password: 'password',
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
