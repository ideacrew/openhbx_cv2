module Openhbx
  module Cv2
    class Enrollment
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'enrollment'
      namespace 'cv'

      has_one :policy, ::Openhbx::Cv2::Policy, tag: "policy"
    end
  end
end
