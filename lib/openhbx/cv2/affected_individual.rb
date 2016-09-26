module Openhbx
  module Cv2
    class AffectedIndividual
      include HappyMapper
      include ::Openhbx::Cv2::Namespace

      register_namespace "cv", NS_URI
      tag 'affected_individual'
      namespace 'cv'

      element :individual_id, String, tag: "individual_id"
      has_one :previous_individual_information, Openhbx::Cv2::PreviousIndividualInformation, tag: "previous_individual_information"
    end
  end
end
