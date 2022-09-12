module Openhbx::Cv2
  class PremiumCredit
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'premium_credit'
    namespace 'cv'

    element :kind, String, tag: "kind"
    element :value, String, tag: "value"
  end
end