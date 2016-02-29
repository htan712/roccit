require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: "Hock Tan", email: "jtan712@bloc.com", password: "password") }
  let(:topic) { Topic.create!(name: Faker::Hipster.sentence, description: Faker::Hipster.paragraph) }
  let(:post) { topic.posts.create!(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph, user: user) }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

   describe "attributes" do
     it "responds to body" do
       expect(comment).to respond_to(:body)
     end
   end
end
