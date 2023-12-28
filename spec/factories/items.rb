FactoryBot.define do
  factory :item do
    product_name { Faker::Commerce.product_name }
    explanation { Faker::Lorem.paragraph }
    category_id { 2 }
    status_id { 2 }
    postage_id { 2 }
    shipping_id { 2 }
    number_of_day_id { 2 }
    price { 3000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end