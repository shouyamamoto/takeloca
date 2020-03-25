class FavoritesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    current_user.favorite(article)
    redirect_to article
  end

  def destroy
    article = Article.find(params[:article_id])
    current_user.unfavorite(article)
    redirect_to article
  end
end
