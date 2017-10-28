class MainController < ApplicationController
  before_action :set_categories, only: [:index, :search]
  before_action :set_tags, only: [:index, :search]
  skip_before_action :authenticate_user!, only: [:search]

  def search
    @articles = Article.ransack(name_or_body_cont: params[:q]).result(distinct: true)
    @categories = Category.ransack(name_cont: params[:q]).result(distinct: true)
    @tags = Tag.ransack(name_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @articles    = @articles.limit(5)
        @categories = @categories.limit(5)
        @tags = @tags.limit(5)
      }
    end
  end

private

  def set_categories
    @categories = Category.order('name asc')
  end

  def set_tags
    @tags = Tag.order('name asc')
  end
end
