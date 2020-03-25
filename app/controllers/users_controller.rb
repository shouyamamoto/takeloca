class UsersController < ApplicationController
  before_action :require_user_logged_in, only:[:show, :edit, :update, :search, :favorites]
  
  def index
    @users = User.all
    @articles = Article.all.order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(edit_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  def search
    @q = Article.ransack(search_params)
    @articles = @q.result(distinct: true)
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorite_articles
  end
  
  private
  
  def edit_params
    params.require(:user).permit(:name, :email, :password)
  end
  
  def search_params
    params.require(:q).permit(:location_eq)
  end
  
  def require_user_logged_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end
