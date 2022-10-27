FactoryBot.define do

  factory :user do
    nickname               {Faker::Name.initials(number: 2)}
    birth_day              {"2000-01-01"}
    first_name             {"太郎"}
    family_name            {"山田"}
    first_name_kana        {"タロウ"}
    family_name_kana       {"ヤマダ"}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    email                  {Faker::Internet.free_email}
  end
end
