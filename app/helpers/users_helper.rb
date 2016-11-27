module UsersHelper
  def user_has_comments
    current_user.comments.exists?
  end

  def user_has_posts
    current_user.posts.exists?
  end
end
