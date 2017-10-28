class AddProtectedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :protected, :boolean, default: true
  end
end
