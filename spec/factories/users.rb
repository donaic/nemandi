FactoryGirl.define do
  factory :user do
    first_name 		Faker::Name.first_name
    middle_name		Faker::Name.first_name
    last_name	  	Faker::Name.last_name
    address       Faker::Address.street_address
    phone_number	Faker::PhoneNumber.phone_number

    transient do
      role          Registration.roles[:student]
      authorization Registration.authorizations[:read]
    end


    after :build do |user|
      user.credential ||= build(:credential, user: user)
    end


    trait :with_school do
      after :build do |user, evaluator|
        school = build(:school)
        user.registrations << build(:school_registration, registerable: school, user: user,
                                 role: evaluator.role, authorization: evaluator.authorization)
      end
    end

    trait :with_klass do
      after :build do |user, evaluator|
        klass = build(:klass)
        user.registrations << build(:klass_registration, registerable: klass, user: user,
                                 role: evaluator.role, authorization: evaluator.authorization)
      end
    end

    trait :with_school_and_klass do
      after :build do |user, evaluator|
        school = build(:school_with_klass)
        klass  = school.klasses.last
        user.registrations << build(:school_registration, registerable: school, user: user,
                                 role: evaluator.role, authorization: evaluator.authorization)
        user.registrations << build(:klass_registration, registerable: klass, user: user,
                                 role: evaluator.role, authorization: evaluator.authorization)
      end
    end

    factory :user_with_school, traits: [:with_school]
    factory :user_with_klass,  traits: [:with_klass]
    factory :user_with_all,    traits: [:with_school_and_klass]
  end
end
