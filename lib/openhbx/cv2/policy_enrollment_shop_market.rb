module Openhbx::Cv2
  class PolicyEnrollmentShopMarket
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'shop_market'
    namespace 'cv'

    element "total_employer_responsible_amount", String, tag: "total_employer_responsible_amount"
    has_one "employer", Openhbx::Cv2::EmployerLink, tag: "employer"
  end
end
