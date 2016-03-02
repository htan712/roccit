require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:topic) { Topic.create!(name: Faker::Hipster.sentence, description: Faker::Hipster.paragraph) }
  let(:user) { User.create!(name: 'Bloccit User', email: 'user@bloccit.com', password: 'helloworld') }
  let(:post) { topic.posts.create!(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph, user: user) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  it { is_expected.to belong_to(:user)}
  it { is_expected.to belong_to(:post)}

end
