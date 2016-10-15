module Openhbx::Cv2
  class TaxHouseholdMember
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'tax_household_member'
    namespace 'cv'

    element :id, String, tag: "person/cv:id/cv:id"
    element :name_prefix, String, tag: "person/cv:person_name/cv:person_name_prefix_text"
    element :first_name, String, tag: "person/cv:person_name/cv:person_given_name"
    element :middle_name, String, tag: "person/cv:person_name/cv:person_middle_name"
    element :last_name, String, tag: "person/cv:person_name/cv:person_surname"
    element :name_suffix, String, tag: "person/cv:person_name/cv:person_name_suffix_text"
    element :is_without_assistance, String, tag: "is_without_assistance"
    element :is_enrolled_in_employer_sponsored_coverage, String, tag: "is_enrolled_in_employer_sponsored_coverage"
    element :is_insurance_assistance_eligible, String, tag: "is_insurance_assistance_eligible"
    element :is_medicaid_chip_eligible, String, tag: "is_medicaid_chip_eligible"
  end
end
