class Category < ApplicationRecord
  has_many :categorizations
  has_many :articles, through: :categorizations
  validates :name, presence: true, length: { in: 2..30 }
end
