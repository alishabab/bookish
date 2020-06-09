module ApplicationHelper
  def is_upvoted?
    @vote = Vote.find_by(UserId: current_user.id, ArticleId: params[:id])
    if @vote
      return true
    else
    return false
    end
  end

  def all_categories
    Category.all
  end
end
