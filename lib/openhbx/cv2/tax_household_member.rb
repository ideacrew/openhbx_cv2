module Openhbx::Cv2
  class TaxHouseholdMember
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'tax_household_member'
    namespace 'cv'
  end
end
