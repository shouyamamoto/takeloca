class RemoveMonthFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :month, :string
  end
end
