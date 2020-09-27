FactoryBot.define do
  
  factory :coffe do
  name { Faker::Coffee.blend_name }
  articlenbr { Faker::Number.between(from: 10, to: 999) }
  price { Faker::Number.between(from: 29, to: 229) }
  description { Faker::Coffee.notes }
  
  end
end


 