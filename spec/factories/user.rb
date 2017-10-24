FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password '12345'
    username { Faker::Internet.user_name }
  end
end
