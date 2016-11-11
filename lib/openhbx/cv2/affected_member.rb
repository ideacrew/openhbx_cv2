module Openhbx::Cv2
  class AffectedMember
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'affected_member'
    namespace 'cv'
  end
end
