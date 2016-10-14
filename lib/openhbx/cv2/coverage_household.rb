module Openhbx::Cv2
  class CoverageHousehold 
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'coverage_household'
    namespace 'cv'
  end
end
