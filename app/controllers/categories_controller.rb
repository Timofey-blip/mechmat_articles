class CategoriesController < ApplicationController
  def index
    @categories = Category.pluck(:name, :id)
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end
end