module Openhbx::Cv2
  class PolicyEnrollment
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'enrollment'
    namespace 'cv'

    has_one :plan, Openhbx::Cv2::PlanLink, tag: "plan"
    has_one :eligibility_event, Openhbx::Cv2::EligibilityEvent, tag: "eligibility_event"
    has_one :shop_market, Openhbx::Cv2::PolicyEnrollmentShopMarket, tag: "shop_market"
    has_one :individual_market, Openhbx::Cv2::PolicyEnrollmentIndividualMarket, tag: "individual_market"
    element :premium_total_amount, String, tag: "premium_total_amount"
    element :total_responsible_amount, String, tag: "total_responsible_amount"
  end
end
