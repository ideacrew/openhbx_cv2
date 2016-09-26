module Openhbx::Cv2
  class Enrollee
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'enrollee'
    namespace 'cv'

    element :is_subscriber, String, tag: 'is_subscriber'
    has_one :member, Openhbx::Cv2::EnrolleeMember, tag: 'member'
    has_one :benefit, Openhbx::Cv2::EnrolleeBenefit, tag: 'benefit'

    def subscriber?
      return false if is_subscriber.blank?
      is_subscriber.strip.downcase == "true"
    end
  end
end
