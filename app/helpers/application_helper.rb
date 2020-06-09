module ApplicationHelper
  def upvoted?
    @vote = Vote.find_by(UserId: current_user.id, ArticleId: params[:id])
    if @vote
      true
    else
      false
    end
  end

  def all_categories
    Category.all
  end
end
