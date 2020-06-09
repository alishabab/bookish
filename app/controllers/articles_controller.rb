class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def new
    @article = current_user.articles.build
    @categories = Category.all
  end

  def index
    @categories = Category.order(priority: :desc)
    article_hash = Hash.new(0)
    Vote.all.each do |vote|
      article_hash[vote.ArticleId] += 1
    end
    if !article_hash.keys.empty?
      max_article_id = article_hash.max_by { |_k, v| v }[0]
      @max_article = Article.find(max_article_id)
    else
      @max_article = Article.first
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to @article, flash: { success: 'Article Edited Successfully' } if @article.save
  end

  def create
    @article = current_user.articles.build(article_params)
    category_ids = params[:category_ids]
    category_ids.each do |category_id|
      @article.categories.push(Category.find(category_id))
    end
    if @article.save
      redirect_to @article, flash: { success: 'Article Created Successfully' }
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @vote = Vote.new
  end

  private

  def article_params
    params.require(:article).permit(:Title, :Text, :image)
  end
end
