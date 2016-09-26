module Openhbx
  module Cv2
    class Phone
      include HappyMapper
      include Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'phone'
      namespace 'cv'
    end
  end
end
