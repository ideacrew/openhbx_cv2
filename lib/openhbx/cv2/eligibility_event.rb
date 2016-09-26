module Openhbx::Cv2
  class EligibilityEvent
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'eligibility_event'
    namespace 'cv'

    element :event_kind, String, tag: "event_kind"
    element :event_date, String, tag: "event_date"
  end
end
