FactoryBot.define do
  factory :item do
    association :user
    name { 'hoge' }
    text { Faker::Lorem.sentence }
    price { '12345' }
    postage_id { 2 }
    shipping_area_id { 2 }
    shipping_days_id { 2 }
    category_id { 2 }
    condition_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
