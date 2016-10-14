module Openhbx::Cv2
  class FamilyMember
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'family_member'
    namespace 'cv'

  end
end
