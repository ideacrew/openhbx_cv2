require "spec_helper"

describe Openhbx::Cv2::Enrollment, "given a sample xml" do
  let(:enrollment_type) { "urn:openhbx:terms:v1:enrollment#initial" }
  let(:market_type) { "urn:openhbx:terms:v1:aca_marketplace#cobra" } 
  let(:qualifying_reason) { "urn:openhbx:terms:v1:benefit_maintenance#non_payment" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<enrollment xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <type>#{enrollment_type}</type>
  <qualifying_reason>#{qualifying_reason}</qualifying_reason>
  <market>#{market_type}</market>
  <policy />
</enrollment>
XMLDOC
  }

  subject { Openhbx::Cv2::Enrollment.parse(input_xml, single: true) }

  it "has the correct policy id" do
    expect(subject.policy).to be_kind_of Openhbx::Cv2::Policy
  end

  it "has the correct type" do
    expect(subject.enrollment_type).to eq enrollment_type
  end

  it "has the correct market" do
    expect(subject.market).to eq market_type
  end

  it "has the correct qualifying reason" do
    expect(subject.qualifying_reason).to eq qualifying_reason
  end
end
