class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @categories = Category.all
    @article = current_user.articles.build
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
    @categories = Category.all
    @article = Article.find(params[:id])
  end

  def update
    @categories = Category.all
    @article = Article.find(params[:id])
    @article.update(article_params)
    @article.categories.destroy_all
    category_ids = params[:category_ids]
    category_ids&.each do |category_id|
      @article.categories.push(Category.find(category_id))
    end
    redirect_to @article, flash: { success: 'Article Edited Successfully' } if @article.save
  end

  def create
    @categories = Category.all
    @article = current_user.articles.build(article_params)
    category_ids = params[:category_ids]
    category_ids&.each do |category_id|
      @article.categories.push(Category.find(category_id))
    end

    if @article.save
      redirect_to @article, flash: { success: 'Article Created Successfully' }
    else
      flash[:error] = @article.errors.full_messages
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @vote = Vote.new
  end

  def my_articles
    @articles = current_user.articles
    @has_articles = true if @articles.length.positive?
  end

  def destroy
    @article = Article.find(params[:id])
    return unless @article.author == current_user

    @article.destroy
    redirect_to my_articles_path, flash: { success: 'Article Deleted' }
  end

  private

  def article_params
    params.require(:article).permit(:Title, :Text, :image)
  end
end
