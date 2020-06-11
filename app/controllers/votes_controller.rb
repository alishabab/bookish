class VotesController < ApplicationController
  before_action :authenticate_user!
  def upvote
    @vote = current_user.votes.build(ArticleId: params[:article_id])
    redirect_back fallback_location: '/' if @vote.save
  end

  def downvote
    @vote = Vote.find_by(UserId: current_user.id, ArticleId: params[:article_id])
    @vote.destroy
    redirect_back fallback_location: '/'
  end
end
