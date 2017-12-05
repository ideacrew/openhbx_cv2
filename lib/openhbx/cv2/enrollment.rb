module Openhbx
  module Cv2
    class Enrollment
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'enrollment'
      namespace 'cv'

      element :enrollment_type, String, tag: "type"
      element :market, String, tag: "market"
      has_one :policy, ::Openhbx::Cv2::Policy, tag: "policy"
    end
  end
end
