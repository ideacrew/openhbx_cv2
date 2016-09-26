require "spec_helper"

describe Openhbx::Cv2::TradingPartnerCoverageEvent, "given a sample xml" do

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<trading_partner_coverage_event xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <event_context/>
  <policy/>
</trading_partner_coverage_event>
XMLDOC
  }

  subject { Openhbx::Cv2::TradingPartnerCoverageEvent.parse(input_xml, single: true) }

  it "has one event context" do
    expect(subject.event_context).not_to eq nil
  end

  it "has one policy" do
    expect(subject.policy).not_to eq nil
  end
end
