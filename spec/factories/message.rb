FactoryBot.define do
  factory :message do
    body Faker::Lorem.sentence(5)
    subject Faker::Lorem.sentence
  end
end
