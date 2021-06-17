module Openhbx
  module Cv2
    class PersonHealth
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'person_health'
      namespace 'cv'

      element :is_tobacco_user, String, tag: "is_tobacco_user", namespace: "cv" 
      element :is_disabled, Boolean, tag: "is_disabled", namespace: "cv"

      def disability_value
        (is_disabled == nil) ? false : is_disabled
      end

      def tobacco_use_value
        case is_tobacco_user
        when "true"
          "Y"
        when "false"
          "N"
        else
          nil
        end
      end
    end
  end
end
