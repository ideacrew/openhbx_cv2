require "spec_helper"

describe Openhbx::Cv2::PremiumCredit, "given a sample xml" do
  let(:credit_amount) { "123.45" }
  let(:credit_kind) { "urn:dc0:terms:v1:premium_credit_kind#osse" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<premium_credit xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <kind>#{credit_kind}</kind>
  <value>#{credit_amount}</value>
</premium_credit>
XMLDOC
  }

  subject { Openhbx::Cv2::PremiumCredit.parse(input_xml, single: true) }

  it "has a value" do
    expect(subject.value).to eq(credit_amount)
  end

  it "has a kind" do
    expect(subject.kind).to eq(credit_kind)
  end
end