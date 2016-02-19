require "random_data"

50.times do
  Post.create!(
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
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
