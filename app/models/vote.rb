class Vote < ApplicationRecord
  belongs_to :user, foreign_key: 'UserId'
  belongs_to :article, foreign_key: 'ArticleId'
end
