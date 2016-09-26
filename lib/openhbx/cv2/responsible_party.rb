module Openhbx::Cv2
  class ResponsibleParty
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'responsible_party'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    element :name_prefix, String, tag: "person_name/cv:person_name_prefix_text"
    element :first_name, String, tag: "person_name/cv:person_given_name"
    element :middle_name, String, tag: "person_name/cv:person_middle_name"
    element :last_name, String, tag: "person_name/cv:person_surname"
    element :name_suffix, String, tag: "person_name/cv:person_name_suffix_text"
    has_many :addresses, ::Openhbx::Cv2::Address, xpath: "cv:addresses"
    has_many :emails, ::Openhbx::Cv2::Email, xpath: "cv:emails"
    has_many :phones, ::Openhbx::Cv2::Phone, xpath: "cv:phones"
  end
end
