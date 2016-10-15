module Openhbx::Cv2
  class TaxHousehold
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'tax_household'
    namespace 'cv'
    element :id, String, tag: "id/cv:id"
    element :primary_applicant_id, String, tag: "primary_applicant_id/cv:id"
    element :start_date, String, tag: "start_date"
    element :end_date, String, tag: "end_date"
    has_many :tax_household_members, ::Openhbx::Cv2::TaxHouseholdMember, xpath: "cv:tax_household_members"
  end
end
