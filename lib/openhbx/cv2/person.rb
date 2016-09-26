module Openhbx
  module Cv2
    class Person
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'person'
      namespace 'cv'

      element :id, String, tag: "id/cv:id"
      element :job_title, String, tag: "job_title"
      element :department, String, tag: "department"
      element :name_prefix, String, tag: "person_name/cv:person_name_prefix_text"
      element :first_name, String, tag: "person_name/cv:person_given_name"
      element :middle_name, String, tag: "person_name/cv:person_middle_name"
      element :last_name, String, tag: "person_name/cv:person_surname"
      element :name_suffix, String, tag: "person_name/cv:person_name_suffix_text"
      has_many :addresses, ::Openhbx::Cv2::Address, xpath: "cv:addresses"
      has_many :emails, ::Openhbx::Cv2::Email, xpath: "cv:emails"
      has_many :phones, ::Openhbx::Cv2::Phone, xpath: "cv:phones"

      def home_address
        addresses.detect do |addy|
          (!addy.type.blank?) && (addy.type.strip == "urn:openhbx:terms:v1:address_type#home")
        end
      end

      def mailing_address
        addresses.detect do |addy|
          (!addy.type.blank?) && (addy.type.strip == "urn:openhbx:terms:v1:address_type#mailing")
        end
      end
    end
  end
end
