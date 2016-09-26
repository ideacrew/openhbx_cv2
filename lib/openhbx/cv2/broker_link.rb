module Openhbx
  module Cv2
    class BrokerLink
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'broker'
      namespace 'cv'

      element :id, String, tag: "id/cv:id"
      element :name, String, tag: "name"
      element :dba, String, tag: "dba"
      element :display_name, String, tag: "display_name"

      def npn_from_id
        return nil if id.blank? 
        id.strip.split("#").last
      end
    end
  end
end
