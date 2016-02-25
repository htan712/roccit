require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:topic) { Topic.create!(name: Faker::Hipster.sentence, description: Faker::Hipster.paragraph) }

  let(:post) { topic.posts.create!(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph) }

  it { is_expected.to belong_to(:topic) }

   describe "attributes" do
     it "responds to title" do
       expect(post).to respond_to(:title)
     end
     it "responds to body" do
       expect(post).to respond_to(:body)
     end
   end
end
