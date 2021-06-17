module Openhbx::Cv2
  class EnrolleeMember
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'member'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    element :primary_family_id, String, tag: "primary_family_id/cv:id"
    element :tax_household_id, String, tag: "tax_household_id/cv:id"
    has_one :person, Openhbx::Cv2::Person, tag: "person"
    has_many :person_relationships, Openhbx::Cv2::PersonRelationship, xpath: "cv:person_relationships"
    has_one :person_demographics, Openhbx::Cv2::PersonDemographics, tag: "person_demographics"
    element :is_primary_applicant, String, tag: "is_primary_applicant"
    element :is_coverage_applicant, String, tag: "is_coverage_applicant"
    element :is_without_assistance, String, tag: "is_without_assistance"
    element :is_enrolled_in_employer_sponsored_coverage, String, tag: "is_enrolled_in_employer_sponsored_coverage"
    element :is_insurance_assistance_eligible, String, tag: "is_insurance_assistance_eligible"
    element :is_medicaid_chip_eligible, String, tag: "is_medicaid_chip_eligible"
    has_many :employee_roles, Openhbx::Cv2::EmployeeRole, xpath: "cv:employee_roles"

    has_one :person_health, Openhbx::Cv2::PersonHealth

    delegate :first_name, :middle_name, :last_name, :name_prefix, :name_suffix, to: :person, allow_nil: true
    delegate :ssn, :sex, :birth_date, :death_date, to: :person_demographics, allow_nil: true

    delegate :home_address, :mailing_address, to: :person, allow_nil: true

    delegate :tobacco_use_value, to: :person_health, allow_nil: true

    def disability_value
      (person_health == nil) ? false : person_health.disability_value
    end
  end
end
