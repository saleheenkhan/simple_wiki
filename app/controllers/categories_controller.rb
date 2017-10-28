class CategoriesController < ApplicationController
  before_action :set_categories, only: [:index, :show]
  before_action :set_tags, only: [:index, :show]
  before_action :disallow_user, only: [:create]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @categories = Category.order("name asc")
  end

  def show
    @category = Category.friendly.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category
    else
      render json: {errors: @category.errors.full_messages}
    end
  end

private

  def set_categories
    @categories = Category.order('name asc')
  end

  def set_tags
    @tags = Tag.order('name asc')
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
