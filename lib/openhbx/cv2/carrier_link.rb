module Openhbx
  module Cv2
    class CarrierLink
      include HappyMapper
      include Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'carrier'
      namespace 'cv'

      element :id, String, tag: "id/cv:id"
      element :name, String, tag: "name"
      element :display_name, String, tag: "display_name"
    end
  end
end
