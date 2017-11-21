module Openhbx
  module Cv2
    class EnrollmentEventHeader
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'header'
      namespace 'cv'

      element "submitted_timestamp", String, tag: "submitted_timestamp"
    end
  end
end
