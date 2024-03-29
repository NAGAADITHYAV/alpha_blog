# calss for article management
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def show; end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article has been created sucessfully'
      redirect_to @article
    else
      render 'new'
    end
  end

  def new
    @article = Article.new
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article has been updated sucessfully'
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit; end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find_by(id: params[:id])
  end
end
