require 'rails_helper'

include ModuleHelper

required_attr = [:role]
optional_attr = []
required_assc = [:user, :registerable]
optional_assc = []

describe Registration do
  validate_required_attributes(:school_registration, *required_attr)
  validate_optional_attributes(:school_registration, *optional_attr)
  validate_required_associations(:school_registration, *required_assc)
  validate_optional_associations(:school_registration, *optional_assc)

  context "Relationships:" do
    it { is_expected.to belong_to(:user)}
    it { is_expected.to belong_to(:registerable)}
  end
end
