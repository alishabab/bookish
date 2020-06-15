module ApplicationHelper
  def upvoted?(article)
    @vote = Vote.find_by(UserId: current_user.id, ArticleId: article.id)
    if @vote
      true
    else
      false
    end
  end

  def all_categories
    Category.all.limit(4)
  end

  def admin?
    current_user == User.find_by(username: 'admin')
  end

  def default_img
    'https://cdn.pixabay.com/photo/2015/10/31/14/33/dark-1015824_960_720.jpg'
  end
end
