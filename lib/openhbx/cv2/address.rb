module Openhbx
  module Cv2
    class Address
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'address'
      namespace 'cv'

      element :type, String, tag: "type"
      element :address_line_1, String, tag: "address_line_1"
      element :address_line_2, String, tag: "address_line_2"
      element :location_city_name, String, tag: "location_city_name"
      element :location_state_code, String, tag: "location_state_code"
      element :postal_code, String, tag: "postal_code"

      def same_location_as?(other_addy)
        return false if other_addy.nil?
        compare_values(postal_code, other_addy.postal_code) &&
          compare_values(location_state_code, other_addy.location_state_code) &&
          compare_values(location_city_name, other_addy.location_city_name) &&
          compare_values(address_line_1, other_addy.address_line_1) &&
          compare_values(address_line_2, other_addy.address_line_2)
      end

      def compare_values(val1, val2)
        string_for_compare(val1) == string_for_compare(val2)
      end

      def string_for_compare(val)
        val.blank? ? "" : val.strip.downcase
      end
    end
  end
end
