class ArticlesController < ApplicationController
  http_basic_authenticate_with name:"dumeng", password: "123456", except: [:index, :show]
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create

    @article = Article.new(params_article)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params_article)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


  private
  def params_article
    params.require(:article).permit(:title, :text)
  end
end
