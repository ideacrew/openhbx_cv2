module Openhbx
  module Cv2
    class Organization
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'organization'
      namespace 'cv'

      element :id, String, tag: "id/cv:id"
      element :name, String, tag: "name"
      element :dba, String, tag: "dba"
      element :fein, String, tag: "fein"
      has_many :office_locations, ::Openhbx::Cv2::OfficeLocation, xpath: "cv:office_locations"
      has_many :contacts, ::Openhbx::Cv2::Contact, xpath: "cv:contacts"
    end
  end
end