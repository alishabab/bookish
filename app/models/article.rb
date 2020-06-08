class Article < ApplicationRecord
  has_many :votes, foreign_key: "UserId"
  belongs_to :author, class_name: "User", foreign_key: "AuthorId"
end
