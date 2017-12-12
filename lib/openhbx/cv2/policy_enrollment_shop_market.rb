module Openhbx::Cv2
  class PolicyEnrollmentShopMarket
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'shop_market'
    namespace 'cv'

    element "total_employer_responsible_amount", String, tag: "total_employer_responsible_amount"
    element "composite_rating_tier_name", String, tag: "composite_rating_tier_name"
    element "cobra_eligibility_date", String, tag: "cobra_eligibility_date"
    has_one "employer_link", Openhbx::Cv2::EmployerLink, tag: "employer_link"
  end
end
