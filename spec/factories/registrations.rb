FactoryGirl.define do
  factory :school_registration, class: Registration do
    association :user
    association :registerable, factory: :school
    role          'student'
    authorization 'read'
  end

  factory :klass_registration, class: Registration do
    association :user
    association :registerable, factory: :klass
    role          'student'
    authorization 'read'
  end
end
