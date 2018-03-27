FactoryBot.define do
  factory :comment do
    comment "blablabla"
    restaurant
  end
end

FactoryBot.define do
  factory :restaurant do
    name "mos"
  end
end
