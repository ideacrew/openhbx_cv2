module Openhbx::Cv2
  class EnrolleeBenefit
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'benefit'
    namespace 'cv'

    element :premium_amount, String, tag: "premium_amount"
    element :eligibility_begin_date, String, tag: "eligibility_begin_date"
    element :begin_date, String, tag: "begin_date"
    element :end_date, String, tag: "end_date"
    element :coverage_level, String, tag: "coverage_level"
    element :carrier_assigned_policy_id, String, tag: "carrier_assigned_policy_id"
    element :carrier_assigned_enrollee_id, String, tag: "carrier_assigned_enrollee_id"
  end
end
