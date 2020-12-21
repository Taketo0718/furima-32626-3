FactoryBot.define do
  factory :item_order do
    postal_code {"#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {Faker::Address.city}
    addresses {Faker::Address.street_address}
    building {"千里朝日ビル"}
    phone_number {Faker::Number.number(digits: 11)}
    item_id {"1"}
    user_id {"100"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
