require 'rails_helper'

RSpec.describe Label, type: :model do
  let(:topic) { Topic.create!(name: Faker::Hipster.sentence, description: Faker::Hipster.paragraph) }
  let(:user) { User.create!(name: 'Hock Tan', email: 'jtan712@bloc.com', password: 'password') }
  let(:post) { topic.posts.create!(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph, user: user) }
  let(:label) { Label.create!(name: 'Label') }
  let(:label2) { Label.create!(name: 'Label2') }

  it { is_expected.to have_many :labelings }
  it { is_expected.to have_many(:topics).through(:labelings) }
  it { is_expected.to have_many(:posts).through(:labelings) }

  describe 'labelings' do
    it 'allows the same label to be associated with a different topic and post' do
      topic.labels << label
      post.labels << label

      topic_label = topic.labels[0]
      post_label = post.labels[0]
      expect(topic_label).to eq(post_label)
    end
  end

  describe '.update_labels' do
    it 'takes a comma delimited string and returns an array of Labels' do
      labels = "#{label.name}, #{label2.name}"
      labels_as_a = [label, label2]
      expect(Label.update_labels(labels)).to eq(labels_as_a)
    end
  end
end
