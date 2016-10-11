module Openhbx::Cv2
  class Email
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'email'
    namespace 'cv'

    element :type, String, tag: "type"
    element :email_address, String, tag: "email_address"
  end
end
