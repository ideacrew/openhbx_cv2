require "happymapper"
require "active_support"
require "active_support/core_ext/module"
require "active_support/core_ext/object/blank"

module Openhbx
  module Cv2
    extend ActiveSupport::Autoload
    autoload :Namespace
    autoload :Address
    autoload :Phone
    autoload :Email
    autoload :AffectedIndividual
    autoload :PreviousIndividualInformation
    autoload :BrokerLink
    autoload :CarrierLink
    autoload :EmployerLink
    autoload :PlanLink
    autoload :Person
    autoload :PersonRelationship
    autoload :PersonDemographics
    autoload :EligibilityEvent
    autoload :EmployeeRole
    autoload :Policy
    autoload :PolicyEnrollment
    autoload :PolicyEnrollmentIndividualMarket
    autoload :PolicyEnrollmentShopMarket
    autoload :Enrollee
    autoload :EnrolleeBenefit
    autoload :EnrolleeMember
    autoload :ResponsibleParty
    autoload :TradingPartnerCoverageEvent
    autoload :TradingPartnerCoverageEventContext
  end
end
