class Vote < ApplicationRecord
  belongs_to :user, foreign_key: 'UserId'
  belongs_to :article, foreign_key: 'ArticleId'
  validates :UserId, presence: true
  validates :ArticleId, presence: true
end
