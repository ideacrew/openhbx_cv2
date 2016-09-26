module Openhbx::Cv2
  class Policy
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'policy'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    has_one :broker_link, ::Openhbx::Cv2::BrokerLink, tag: "broker"
    has_one :responsible_party, ::Openhbx::Cv2::ResponsibleParty, tag: "responsible_party"
    has_one :policy_enrollment, ::Openhbx::Cv2::PolicyEnrollment, tag: "enrollment"
    has_many :enrollees, ::Openhbx::Cv2::Enrollee, xpath: "cv:enrollees"
  end
end
