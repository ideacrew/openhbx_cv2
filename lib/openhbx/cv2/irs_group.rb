module Openhbx::Cv2
  class IrsGroup
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'irs_group'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    has_many :tax_household_ids, String, xpath: "cv:tax_household_ids/cv:tax_household_id/cv:id"
    element :effective_start_date, String, tag: "effective_start_date"
    element :effective_end_date, String, tag: "effective_end_date"
  end
end
