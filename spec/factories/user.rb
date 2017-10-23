FactoryGirl.define do
  factory :user do
    email: Faker::email
    password: '12345'
  end
end
