module Openhbx::Cv2
  class PreviousIndividualInformation 
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'previous_individual_information'
    namespace 'cv'

    element :name_prefix, String, tag: "name_prefix"
    element :name_first, String, tag: "name_first"
    element :name_middle, String, tag: "name_middle"
    element :name_last, String, tag: "name_last"
    element :name_suffix, String, tag: "name_suffix"
    element :gender, String, tag: "gender"
    element :dob, String, tag: "dob"
    element :ssn, String, tag: "ssn"
  end
end
