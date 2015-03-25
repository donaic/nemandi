require 'rails_helper'
include ModuleHelper

required_attr = [:email, :encrypted_password]
optional_attr = [:reset_password_token, :reset_password_sent_at,
                 :remember_created_at, :current_sign_in_at, :last_sign_in_at,
                 :current_sign_in_ip, :last_sign_in_ip, :confirmation_token,
                 :confirmed_at, :confirmation_sent_at, :unconfirmed_email,
                 :user_id, :sign_in_count]
required_assc = []
optional_assc = [:user]

describe Credential do
  validate_required_attributes(:credential_confirmed, *required_attr)
  validate_optional_attributes(:credential_confirmed, *optional_attr)
  validate_required_associations(:credential_confirmed, *required_assc)
  validate_optional_associations(:credential_confirmed, *optional_assc)

  context "Relationships" do
    it { is_expected.to belong_to(:user)}
  end

  context "Invalid Password:" do
    it { is_expected.to ensure_length_of(:password).is_at_least(8) }
    it { is_expected.to ensure_length_of(:password).is_at_most(128) }
  end

  context "Invalid Email:" do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive}

    bad_email = ["user@foo", "user_at_f.com", "user@f,com", " "]
    bad_email.each do |email|
      it "#{email} is an invalid email" do
        credential = FactoryGirl.build(:credential_confirmed, email: email)
        expect(credential).not_to be_valid
      end
    end
  end
end
