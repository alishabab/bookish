FactoryBot.define do
  factory :user do
    name { 'Demo User' }
    username { 'demouser' }
    email { 'demouser@example.com' }
    password { 'demouser' }
  end
end
