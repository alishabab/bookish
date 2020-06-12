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
end
