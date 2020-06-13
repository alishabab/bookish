class AddForiegnKeyToArticles < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :articles, :users, column: 'AuthorId'
  end
end
