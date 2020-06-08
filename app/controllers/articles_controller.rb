class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def new
    @article = current_user.articles.build
  end
  def index

  end
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to root_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  private

  def article_params
    params.require(:article).permit(:Title, :Text)
  end

end
