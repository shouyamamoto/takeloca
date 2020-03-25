class AddDetailsToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :details, :string
  end
end
