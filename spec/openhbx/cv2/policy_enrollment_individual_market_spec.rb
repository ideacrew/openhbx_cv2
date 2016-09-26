require "spec_helper"

describe Openhbx::Cv2::PolicyEnrollmentIndividualMarket, "given a sample xml" do
  let(:is_carrier_to_bill) { "false" }
  let(:allocated_aptc_amount) { "968.12" }
  let(:applied_aptc_amount) { "12.34" }
  let(:elected_aptc_percent) { "0.95" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<individual_market xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <is_carrier_to_bill>#{is_carrier_to_bill}</is_carrier_to_bill>
  <allocated_aptc_amount>#{allocated_aptc_amount}</allocated_aptc_amount>
  <elected_aptc_percent>#{elected_aptc_percent}</elected_aptc_percent>
  <applied_aptc_amount>#{applied_aptc_amount}</applied_aptc_amount>
</individual_market>
XMLDOC
  }

  subject { Openhbx::Cv2::PolicyEnrollmentIndividualMarket.parse(input_xml, single: true) }

  it "has the correct is_carrier_to_bill" do
    expect(subject.is_carrier_to_bill).to eq is_carrier_to_bill
  end

  it "has the correct allocated_aptc_amount" do
    expect(subject.allocated_aptc_amount).to eq allocated_aptc_amount
  end

  it "has the correct elected_aptc_percent" do
    expect(subject.elected_aptc_percent).to eq elected_aptc_percent
  end

  it "has the correct applied_aptc_amount" do
    expect(subject.applied_aptc_amount).to eq applied_aptc_amount
  end
end
