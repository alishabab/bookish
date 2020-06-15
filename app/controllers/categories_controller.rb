class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if helpers.admin? && @category.save
      redirect_to categories_path, flash: { success: 'Category Created' }
    else
      flash[:error] = @category.errors.full_messages
      redirect_to new_category_path
    end
  end

  def show
    @count = 1
    @category = Category.find(params[:id])
    @articles = @category.articles.order(created_at: :desc)
    @has_articles = true if @articles.length.positive?
  end

  def destroy
    @category = Category.find(params[:id])
    return unless helpers.admin?

    @category.articles.destroy_all
    @category.destroy
    redirect_to categories_path, flash: { success: 'Category Deleted' }
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
