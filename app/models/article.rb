class Article < ApplicationRecord
  has_many :votes, foreign_key: 'ArticleId', dependent: :delete_all
  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId'
  has_many :categorizations, dependent: :delete_all
  has_many :categories, through: :categorizations, dependent: :delete_all
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  validates :Title, presence: true, length: { in: 3..60 }
  validates :Text, presence: true, length: { minimum: 6 }
  validates :categories, presence: true
end
