require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { Topic.create!(name: Faker::Hipster.sentence, description: Faker::Hipster.paragraph) }
  let(:post) { topic.posts.create!(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph) }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

   describe "attributes" do
     it "responds to body" do
       expect(comment).to respond_to(:body)
     end
   end
end
