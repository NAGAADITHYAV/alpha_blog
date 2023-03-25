class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

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
    @article = Article.find_by(id: params[:id])
    if @article.update(article_params)
      flash[:notice] = 'Article has been updated sucessfully'
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
