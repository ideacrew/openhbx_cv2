module Openhbx
  module Cv2
    class EnrollmentEventEvent
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'event'
      namespace 'cv'

      element :resource_instance_id, String, xpath: "cv:header/cv:resource_instance_uri/cv:id/cv:id"
      element :event_name, String, tag: "event_name"
      has_one :body, ::Openhbx::Cv2::EnrollmentEventBody, tag: "body/cv:enrollment_event_body"
    end
  end
end
