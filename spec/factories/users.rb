FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    last_name { "田中" }
    first_name { "太郎" }
    last_name_reading { "タナカ" }
    first_name_reading { "タロウ" }
    email {Faker::Internet.email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    birth { Faker::Date.birthday }
  end
end