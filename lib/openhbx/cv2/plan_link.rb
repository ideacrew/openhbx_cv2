module Openhbx
  module Cv2
    class PlanLink
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'plan'
      namespace 'cv'

      element :id, String, tag: "id/cv:id"
      element :name, String, tag: "name"
      element :active_year, String, tag: "active_year"
      element :metal_level, String, tag: "metal_level"
      element :is_dental_only, String, tag: "is_dental_only"
      element :coverage_type, String, tag: "coverage_type"
      element :ehb_percent, String, tag: "ehb_percent"
      element :alias_ids, String, single: false, tag: "id/cv:alias_ids/cv:alias_id/cv:id"
      has_one :carrier, Openhbx::Cv2::CarrierLink, tag: "carrier"

    end
  end
end
