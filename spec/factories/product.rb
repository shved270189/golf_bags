FactoryGirl.define do
  factory :product do
    name { Faker::Company.name }
    type { Faker::Pokemon.name }
    length { Faker::Number.between(1, 20) }
    width { Faker::Number.between(1, 20) }
    height { Faker::Number.between(1, 20) }
    weight { Faker::Number.between(1, 20) }
  end
end
