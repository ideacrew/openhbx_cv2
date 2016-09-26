module Openhbx::Cv2
  class TradingPartnerCoverageEvent
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'trading_partner_coverage_event'
    namespace 'cv'
    has_one :event_context, ::Openhbx::Cv2::TradingPartnerCoverageEventContext, tag: 'event_context'
    has_one :policy, ::Openhbx::Cv2::Policy, tag: 'policy'
  end
end
