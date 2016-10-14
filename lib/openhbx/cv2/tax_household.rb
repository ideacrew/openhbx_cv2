module Openhbx::Cv2
  class TaxHousehold
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'tax_household'
    namespace 'cv'
  end
end
