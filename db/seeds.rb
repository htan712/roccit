require "random_data"

15.times do
  Topic.create!(
    name:         Faker::Hipster.sentence,
    description:  Faker::Hipster.paragraph
  )
end
topics = Topic.all


50.times do
  Post.create!(
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

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
