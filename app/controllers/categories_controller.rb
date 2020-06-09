class CategoriesController < ApplicationController
  def index
  end
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order(createdAt: :desc)
  end
end
