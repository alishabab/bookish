class Category < ApplicationRecord
  has_many :categorizations
  has_many :articles, through: :categorizations, dependent: :destroy
  validates :name, presence: true, length: { in: 2..30 }, uniqueness: true
end
