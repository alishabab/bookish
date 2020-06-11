class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order(created_at: :desc)
    @has_articles = true if @articles.length.positive?
  end
end
