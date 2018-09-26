module Openhbx
  module Cv2
    class OfficeLocation
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'office_location'
      namespace 'cv'

      element :id, String, tag: "id/cv:id"
      element :name, String, tag: "name"
      element :is_primary, Boolean, tag: "primary"
      has_one :address, ::Openhbx::Cv2::Address, tag: "address"
      has_one :phone, ::Openhbx::Cv2::Phone, tag: "phone"
    end
  end
end