class FavoriteMailer < ApplicationMailer
  default from: 'hock.tan712@gmail.com'

  def new_comment(user, post, comment)
    headers['Message-ID'] = "<comments/#{comment.id}@roccit.example>"
    headers['In-Reply-To'] = "<post/#{post.id}@roccit.example>"
    headers['References'] = "<post/#{post.id}@roccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
