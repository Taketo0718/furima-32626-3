FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    catch_copy {Faker::Lorem.sentence}
    concept {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end