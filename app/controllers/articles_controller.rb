class ArticlesController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :show, :edit, :update, :new, :create, :destroy]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to user_path(id: current_user.id)
  end
  
  private
  
  def article_params
    params.require(:article).permit(:article_image, :title, :body, :location, :details)
  end
  
  def require_user_logged_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
