module Openhbx::Cv2
  class EmployerLink
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'employer_link'
    namespace 'cv'

    element :id, String, tag: "id/cv:id"
    element :name, String, tag: "name"
    element :dba, String, tag: "dba"
  end
end
