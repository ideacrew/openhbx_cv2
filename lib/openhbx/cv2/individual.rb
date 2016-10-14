module Openhbx
  module Cv2
    class Individual
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'individual'
      namespace 'cv'

      element :id, String, tag: "id/cv:id"
      has_one :person, ::Openhbx::Cv2::Person, tag: "person"
      has_one :person_demographics, ::Openhbx::Cv2::PersonDemographics, tag: "person_demographics"
      element :created_at, Time, tag: "created_at"
      element :updated_at, Time, tag: "updated_at"
    end
  end
end
