module Openhbx::Cv2
  class IrsGroup
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'irs_group'
    namespace 'cv'

  end
end
