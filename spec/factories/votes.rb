FactoryBot.define do
  factory :vote do
    UserId { User.last.id }
    ArticleId { Article.last.id }
  end
end
