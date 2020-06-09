class Article < ApplicationRecord
  has_many :votes, foreign_key: "ArticleId", dependent: :delete_all
  belongs_to :author, class_name: "User", foreign_key: "AuthorId"
  has_many :categorizations, dependent: :delete_all
  has_many :categories, through: :categorizations, dependent: :delete_all
end


