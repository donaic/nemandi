FactoryGirl.define do
  factory :credential do
    email         { Faker::Internet.safe_email }
    password		  Faker::Internet.password

    trait :confirmed do
      confirmed_at  Time.now
    end

    factory :credential_confirmed,  traits: [:confirmed]
  end
end
