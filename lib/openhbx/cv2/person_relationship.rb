module Openhbx
  module Cv2
    class PersonRelationship
      include HappyMapper
      include Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'person_relationship'
      namespace 'cv'

      element :subject_individual, String, tag: "subject_individual"
      element :relationship_uri, String, tag: "relationship_uri"
      element :inverse_relationship_uri, String, tag: "inverse_relationship_uri"
      element :object_individual, String, tag: "object_individual"
    end
  end
end
