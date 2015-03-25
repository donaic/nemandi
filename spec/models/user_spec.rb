require "rails_helper"
include ModuleHelper

required_attr = []
optional_attr = [:first_name, :last_name, :middle_name,:phone_number, :address]
required_assc = [:credential]
optional_assc = [:registrations]

describe User do
  validate_required_attributes(:user_with_all, *required_attr)
  validate_optional_attributes(:user_with_all, *optional_attr)
  validate_required_associations(:user_with_all, *required_assc)
  validate_optional_associations(:user_with_all, *optional_assc)

  context "Relationships:" do
    it { is_expected.to have_one(:credential)}
    it { is_expected.to have_many(:registrations)}
    it { is_expected.to have_many(:schools).through(:registrations)}
    it { is_expected.to have_many(:klasses).through(:registrations)}
  end
end
