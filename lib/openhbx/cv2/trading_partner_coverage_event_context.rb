module Openhbx::Cv2
  class TradingPartnerCoverageEventContext
    include HappyMapper
    include ::Openhbx::Cv2::Namespace

    register_namespace "cv", NS_URI
    tag 'event_context'
    namespace 'cv'

    element :transaction_id, String, tag: "transaction_id"
    element :trading_partner_id, String, tag: "trading_partner_id"
    element :marketplace_type, String, tag: "marketplace_type"
    element :coverage_action, String, tag: "coverage_action"
    element :coverage_action_reason, String, tag: "coverage_action_reason"
    has_many :affected_individuals, ::Openhbx::Cv2::AffectedIndividual, xpath: "cv:affected_individuals"
  end
end
