module Openhbx
  module Cv2
    class EnrollmentEventBody
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'enrollment_event_body'
      namespace 'cv'

      has_one :enrollment, Enrollment, tag: "enrollment"
    end
  end
end
