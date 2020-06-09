class VotesController < ApplicationController
 
  def upvote
    @vote = current_user.votes.build(ArticleId: params[:article_id])
    if @vote.save
      redirect_to article_path(params[:article_id])
    end
  end

  def downvote 
    @vote = Vote.find_by(UserId: current_user.id, ArticleId: params[:article_id])
    @vote.destroy
    redirect_to article_path(params[:article_id])
  end
end
