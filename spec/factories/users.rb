FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4, mix_case: true) }
    password_confirmation { password }
    name_last { Gimei.last.kanji }
    name_first { Gimei.first.kanji }
    name_last_kana { Gimei.last.katakana }
    name_first_kana { Gimei.first.katakana }
    date_of_birth { Faker::Date.backward }
  end
end
