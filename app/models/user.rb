class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :votes, foreign_key: 'UserId'
  has_many :articles, foreign_key: 'AuthorId'
  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, length: { in: 3..20 }, uniqueness: true
end
