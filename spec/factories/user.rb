FactoryBot.define do
  factory :user do
    firstname "John"
    lastname  "Doe"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "123123"
  end
end
