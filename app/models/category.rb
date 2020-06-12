class Category < ApplicationRecord
  has_many :categorizations, dependent: :delete_all
  has_many :articles, through: :categorizations, dependent: :delete_all
  validates :name, presence: true, length: { in: 2..30 }, uniqueness: true
end
