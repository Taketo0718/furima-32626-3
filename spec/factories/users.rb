FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
      address { Gimei.address }
    end
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }

    nickname {Faker::Name.name}    
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length:4) + "1a"}
    birth_date {Faker::Date.between_except(from: '1930-01-01', to: '2016-01-01', excepted: '2016-01-01')}
  end
end