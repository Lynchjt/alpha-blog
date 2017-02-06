class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article Deleted"
    redirect_to articles_path
  end

  def edit
  end
  
  def update
    @article = Article.new(article_params)

    if @article.update(article_params)
      flash[:success] = "Article Was Updated"
      redirect_to article_path(@article)

    else 
      render 'edit'
    end

  end

  def show
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article Was Created"
      redirect_to article_path(@article)
    else 
      render 'new'
    end
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end

end