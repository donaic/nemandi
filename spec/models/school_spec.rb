require 'rails_helper'
include ModuleHelper

required_attr = [:name]
optional_attr = []
required_assc = []
optional_assc = [:registrations, :klasses]

describe School do
  validate_required_attributes(:school_with_all, *required_attr)
  validate_optional_attributes(:school_with_all, *optional_attr)
  validate_required_associations(:school_with_all, *required_assc)
  validate_optional_associations(:school_with_all, *optional_assc)


  context 'Relationships' do
    it { is_expected.to have_many(:klasses)}
    it { is_expected.to have_many(:registrations)}
    it { is_expected.to have_many(:users).through(:registrations)}
  end

  context 'Public Methods:' do
    context 'registered?' do
      it 'user IS NOT registered for school' do
        user   = build(:user)
        school = build(:school)
        expect(school.registered?(user)).to be_falsey
      end
      it 'user IS registered for school' do
        user   = create(:user_with_all)
        school = user.schools.last
        expect(school.registered?(user)).to be_truthy
      end
      it 'user is NULL' do
        user   = nil
        school = build(:school)
        expect(school.registered?(user)).to be_falsey
      end
      it 'school is NULL' do
        user   = build(:user)
        school = nil
        expect{ school.registered?(user) }.to raise_error
      end
    end
  end
end
