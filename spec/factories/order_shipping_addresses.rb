FactoryBot.define do
  factory :order_shipping_address do
    post_code { "123-4567" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { "新宿区" }
    address { "新宿1-1" }
    building_name { "パークハイアット東京" }
    telephone_number { "09012345678" }
  end
end