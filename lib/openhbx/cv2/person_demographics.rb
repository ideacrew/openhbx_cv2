module Openhbx
  module Cv2
    class PersonDemographics
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'person_demographics'
      namespace 'cv'

      element :ssn, String, tag: "ssn"
      element :sex, String, tag: "sex"
      element :birth_date, String, tag: "birth_date"
      element :death_date, String, tag: "death_date"
      element :is_incarcerated, String, tag: "is_incarcerated"
      element :language_code, String, tag: "language_code"
      element :ethnicity, String, tag: "ethnicity"
      element :race, String, tag: "race"
      element :birth_location, String, tag: "birth_location"
      element :marital_status, String, tag: "marital_status"
      element :citizen_status, String, tag: "citizen_status"
      element :is_state_resident, String, tag: "is_state_resident"
    end
  end
end
