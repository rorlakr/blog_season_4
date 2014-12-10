class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article), notice: "성공적으로 업데이트 되었습니다."
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
