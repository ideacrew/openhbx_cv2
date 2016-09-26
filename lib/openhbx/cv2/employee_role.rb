module Openhbx::Cv2
  class EmployeeRole
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'employee_role'
    namespace 'cv'
  end
end
