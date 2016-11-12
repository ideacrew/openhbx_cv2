module Openhbx
  module Cv2
    class EnrollmentEventBody
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'enrollment_event_body'
      namespace 'cv'

      element :transaction_id, String, tag: "transaction_id"
      element :is_trading_partner_publishable, String, tag: "is_trading_partner_publishable"
      has_one :enrollment, Enrollment, tag: "enrollment"
      has_many :affected_members, AffectedMember, xpath: "cv:affected_members"

      def publishable?
        return false if is_trading_partner_publishable.blank?
        "true" == is_trading_partner_publishable.strip.downcase
      end
    end
  end
end
