FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    kana_first_name       {"タロウ"}
    kana_last_name        {"ヤマダ"}
    birth_date            {20000101}
  end
end