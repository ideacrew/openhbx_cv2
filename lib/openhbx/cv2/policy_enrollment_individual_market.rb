module Openhbx::Cv2
  class PolicyEnrollmentIndividualMarket
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'individual_market'
    namespace 'cv'

    element :is_carrier_to_bill, String, tag: "is_carrier_to_bill"
    element :elected_aptc_percent, String, tag: "elected_aptc_percent"
    element :applied_aptc_amount, String, tag: "applied_aptc_amount"
    element :allocated_aptc_amount, String, tag: "allocated_aptc_amount"
  end
end
