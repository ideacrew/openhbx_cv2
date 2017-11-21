module Openhbx
  module Cv2
    class EnrollmentEvent
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'enrollment_event'
      namespace 'cv'

      has_one :header, ::Openhbx::Cv2::EnrollmentEventHeader, tag: "header"
      has_one :event, ::Openhbx::Cv2::EnrollmentEventEvent, tag: "event"
    end
  end
end
