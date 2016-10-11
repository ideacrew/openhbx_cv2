module Openhbx
  module Cv2
    class Phone
      include HappyMapper
      include Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'phone'
      namespace 'cv'

      element :type, String, tag: "type"
      element :full_phone_number, String, tag: "full_phone_number"
    end
  end
end
