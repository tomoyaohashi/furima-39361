FactoryBot.define do
  factory :history_buy do
    postal_id { '123-1234' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone { Faker::Number.number(digits: 10) }
    token { Faker::Internet.password(min_length: 10, max_length: 20) }
  end
end
