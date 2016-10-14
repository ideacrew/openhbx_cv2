module Openhbx::Cv2
  class FamilyHousehold
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'household'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    element :start_date, String, tag: "start_date"
    element :end_date, String, tag: "end_date"
    element :irs_group_id, String, tag: "irs_group_id"
    has_many :coverage_households, ::Openhbx::Cv2::CoverageHousehold, xpath: "cv:coverage_households"
    has_many :tax_households, ::Openhbx::Cv2::TaxHousehold, xpath: "cv:tax_households"
  end
end
