module Openhbx::Cv2
  class CoverageHousehold 
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'coverage_household'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    element :primary_member_id, String, tag: "primary_member_id/cv:id"
    element :is_immediate_family, String, tag: "is_immediate_family"
    element :start_date, String, tag: "start_date"
    element :end_date, String, tag: "end_date"
    has_many :coverage_household_members, ::Openhbx::Cv2::CoverageHouseholdMember, xpath: "cv:coverage_household_members"
  end
end
