class AddLocationToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :location, :string
  end
end
