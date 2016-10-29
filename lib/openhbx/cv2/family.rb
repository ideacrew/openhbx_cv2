module Openhbx::Cv2
  class Family
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'family'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    element :e_case_id, String, tag: "e_case_id"
    element :primary_family_member_id, String, tag: "primary_family_member_id/cv:id"
    has_many :family_members, ::Openhbx::Cv2::FamilyMember, xpath: "cv:family_members"
    has_many :households, ::Openhbx::Cv2::FamilyHousehold, xpath: "cv:households"
    has_many :irs_groups, ::Openhbx::Cv2::IrsGroup, xpath: "cv:irs_groups"
    element :created_at, Time, tag: "created_at"
    element :modified_at, Time, tag: "modified_at"
  end
end
