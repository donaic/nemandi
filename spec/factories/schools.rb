FactoryGirl.define do
  factory :school do
    name Faker::Name.last_name

    trait :with_klass do
      after :build do |school|
        school.klasses << build(:klass)
      end
    end

    factory :school_with_klass, traits: [:with_klass]
    factory :school_with_all,   traits: [:with_klass]
  end
end
