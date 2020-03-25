class AddMonthToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :month, :integer
  end
end
