FactoryBot.define do
  factory :buy_address do
    post_code { '123-4567' }
    shipping_id { 5 }
    city { '東京都' }
    street_address { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
