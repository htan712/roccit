require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:topic) { Topic.create!(name: Faker::Hipster.sentence, description: Faker::Hipster.paragraph) }
  let(:user) { User.create!(name: "Hock Tan", email: "jtan712@bloc.com", password: "password") }

  let(:post) { topic.posts.create!(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph, user: user) }

  it { is_expected.to have_many(:labelings) }
  it { is_expected.to have_many(:labels).through(:labelings) }

  it { is_expected.to belong_to(:topic) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_length_of(:body).is_at_least(20) }

   describe "attributes" do
     it "responds to title" do
       expect(post).to respond_to(:title)
     end
     it "responds to body" do
       expect(post).to respond_to(:body)
     end
   end
end
