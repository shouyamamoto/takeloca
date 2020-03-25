class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  has_many :articles, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  
  def favorite(article)
    self.favorites.find_or_create_by(article_id: article.id)
  end
  
  def unfavorite(article)
    favorite = self.favorites.find_by(article_id: article.id)
    favorite.destroy if favorite
  end
  
  def favorited?(article)
    self.favorite_articles.include?(article)
  end

end
