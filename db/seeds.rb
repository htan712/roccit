require "random_data"

5.times do
  User.create!(
    name: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "password"
  )
end
users = User.all

15.times do
  Topic.create!(
    name:         Faker::Hipster.sentence,
    description:  Faker::Hipster.paragraph
  )
end
topics = Topic.all


50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title:  Faker::Hipster.sentence,
    body:   Faker::Hipster.paragraph(2)
  )
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Hipster.paragraph(2)
  )
end

admin = User.create!(
  name: 'Hockster',
  email: 'jtan712@bloc.com',
  password: 'helloworld',
  role: 'admin'
)

member = User.create!(
  name: 'Natalee',
  email: 'natalee@bloc.com',
  password: 'password',
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
