require 'rails_helper'
include ModuleHelper

required_attr = [:name, :status]
optional_attr = []
required_assc = []
optional_assc = [:registrations, :school]

describe Klass do
  validate_required_attributes(:klass, *required_attr)
  validate_optional_attributes(:klass, *optional_attr)
  validate_required_associations(:klass, *required_assc)
  validate_optional_associations(:klass, *optional_assc)

  context "Relationships" do
    it { is_expected.to belong_to(:school)}
    it { is_expected.to have_many(:registrations)}
    it { is_expected.to have_many(:users).through(:registrations)}
  end

  context 'Public Methods:' do
    context 'registered?' do
      it 'user IS NOT registered for klass' do
        user  = build(:user)
        klass = build(:klass)
        expect(klass.registered?(user)).to be_falsey
      end
      it 'user IS registered for klass' do
        user  = create(:user_with_all)
        klass = user.klasses.last
        expect(klass.registered?(user)).to be_truthy
      end
      it 'user is NULL' do
        user  = nil
        klass = build(:klass)
        expect(klass.registered?(user)).to be_falsey
      end
      it 'klass is NULL' do
        user  = build(:user)
        klass = nil
        expect{ klass.registered?(user) }.to raise_error
      end
    end

    context 'authorized_for_klass?' do
      it 'user IS NOT register for klass and IS NOT an admin' do
        user  = build(:user)
        klass = build(:klass)
        expect(klass.authorized_to_view?(user)).to be_falsey
      end
      it 'user IS registered for klass and IS NOT an admin' do
        user  = create(:user_with_all)
        klass = user.klasses.last
        expect(klass.authorized_to_view?(user)).to be_truthy
      end
      it 'user IS NOT registered for klass and IS an admin' do
        user  = create(:user_with_school, authorization: Registration.authorizations[:write])
        klass = create(:klass, school: user.schools.last)
        expect(klass.authorized_to_view?(user)).to be_truthy
      end
      it 'user IS registered for klass and IS an admin' do
        user  = create(:user_with_all, authorization: Registration.authorizations[:write])
        klass = user.klasses.last
        expect(klass.authorized_to_view?(user)).to be_truthy
      end
      it 'user IS NULL' do
        user  = nil
        klass = build(:klass)
        expect(klass.authorized_to_view?(user)).to be_falsey
      end
      it 'klass IS NULL' do
        user  = build(:user)
        klass = nil
        expect{ klass.authorized_to_view?(user) }.to raise_error
      end
    end
  end
end
