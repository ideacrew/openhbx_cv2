module Openhbx::Cv2
  class CoverageHouseholdMember
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'coverage_household_member'
    namespace 'cv'
  end
end
