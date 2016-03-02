require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: 'Hock Tan', email: 'jtan712@bloc.com', password: 'password') }
  let(:topic) { Topic.create!(name: Faker::Hipster.sentence, description: Faker::Hipster.paragraph) }
  let(:post) { topic.posts.create!(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph, user: user) }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  describe 'attributes' do
    it 'responds to body' do
      expect(comment).to respond_to(:body)
    end
  end

  describe 'after_create' do
    before do
      @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
    end

    it 'sends an email to users who have favorited the post' do
      favorite = user.favorites.create(post: post)
      expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))
      @another_comment.save
    end

    it "does not send emails to users who haven't favorited the post" do
      expect(FavoriteMailer).not_to receive(:new_comment)
      @another_comment.save
    end
  end
end
