class AddMonthToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :month, :string
  end
end
