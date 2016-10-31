module Openhbx
  module Cv2
    class EnrollmentEventEvent
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'event'
      namespace 'cv'

      has_one :body, ::Openhbx::Cv2::EnrollmentEventBody, tag: "body/cv:enrollment_event_body"
    end
  end
end
