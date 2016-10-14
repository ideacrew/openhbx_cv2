module Openhbx::Cv2
  class FamilyHousehold
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'household'
    namespace 'cv'

  end
end
