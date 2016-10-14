require "spec_helper"

describe Openhbx::Cv2::TradingPartnerCoverageEventContext, "given a sample xml" do
  let(:transaction_id) { "12323ASLKFJFKLEJFDFD234234" }
  let(:trading_partner_id) { "A Trading Partner Identifier" }
  let(:market) { "SHOP" }
  let(:coverage_action) { "CANCEL" }
  let(:coverage_action_reason) { "marriage" }
  let(:effective_date) { "20081203" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<event_context xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <transaction_id>#{transaction_id}</transaction_id>
  <effective_date>#{effective_date}</effective_date>
  <trading_partner_id>#{trading_partner_id}</trading_partner_id>
  <marketplace_type>#{market}</marketplace_type>
  <coverage_action>#{coverage_action}</coverage_action>
  <coverage_action_reason>#{coverage_action_reason}</coverage_action_reason>
  <affected_individuals>
    <affected_individual/>
    <affected_individual/>
    <affected_individual/>
  </affected_individuals>
</event_context>
XMLDOC
  }

  subject { Openhbx::Cv2::TradingPartnerCoverageEventContext.parse(input_xml, single: true) }

  it "has the correct transaction_id" do
    expect(subject.transaction_id).to eq transaction_id
  end

  it "has the correct effective_date" do
    expect(subject.effective_date).to eq effective_date
  end

  it "has the correct trading_partner_id" do
    expect(subject.trading_partner_id).to eq trading_partner_id
  end

  it "has the correct marketplace_type" do
    expect(subject.marketplace_type).to eq market
  end

  it "has the correct coverage_action" do
    expect(subject.coverage_action).to eq coverage_action
  end

  it "has the correct coverage_action_reason" do
    expect(subject.coverage_action_reason).to eq coverage_action_reason
  end

  it "has the correct number of affected individuals" do
    expect(subject.affected_individuals.length).to eq 3
  end

end
