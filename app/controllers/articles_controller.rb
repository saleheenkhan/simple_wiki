class ArticlesController < ApplicationController
  before_action :set_categories, only: [:index, :new, :edit, :show]
  before_action :set_tags, only: [:index, :new, :edit, :show]
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :disallow_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.order("name asc")
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
      if @article.save
        redirect_to article_path(@article), notice: "Article Saved!"
      else
        render "new"
      end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to article_path(@article), notice: "Article #{@article.name} has been updated"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Article #{@article.name} has been deleted"
  end

  private

  def article_params
    params.require(:article).permit(:name, :body, :user_id, category_ids: [], tag_ids: [])
  end

  def set_categories
    @categories = Category.order('name asc')
  end

  def set_tags
    @tags = Tag.order('name asc')
  end

  def set_article
    @article = Article.friendly.find(params[:id])
  end
end
