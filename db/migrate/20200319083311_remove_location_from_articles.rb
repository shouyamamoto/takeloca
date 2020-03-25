class RemoveLocationFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :location, :string
  end
end
