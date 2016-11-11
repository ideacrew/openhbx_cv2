module Openhbx
  module Cv2
    class EnrollmentEventBody
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'enrollment_event_body'
      namespace 'cv'

      element :transaction_id, String, tag: "transaction_id"
      has_one :enrollment, Enrollment, tag: "enrollment"
      has_many :affected_members, AffectedMember, xpath: "cv:affected_members"
    end
  end
end
