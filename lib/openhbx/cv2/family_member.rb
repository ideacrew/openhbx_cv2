module Openhbx::Cv2
  class FamilyMember
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'family_member'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    element :primary_family_id, String, tag: "primary_family_id/cv:id"
    element :tax_household_id, String, tag: "tax_household_id/cv:id"
    has_one :person, Openhbx::Cv2::Person, tag: "person"
    has_many :person_relationships, Openhbx::Cv2::PersonRelationship, xpath: "cv:person_relationships"
    has_one :person_demographics, Openhbx::Cv2::PersonDemographics, tag: "person_demographics"
    element :is_primary_applicant, String, tag: "is_primary_applicant"
    element :is_coverage_applicant, String, tag: "is_coverage_applicant"
    has_many :employee_roles, Openhbx::Cv2::EmployeeRole, xpath: "cv:employee_roles"
  end
end
