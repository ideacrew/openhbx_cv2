require "spec_helper"

describe Openhbx::Cv2::PolicyEnrollmentShopMarket, "given a sample xml" do
  let(:total_employer_responsible_amount) { "93.24" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<shop_market xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <employer_link />
  <total_employer_responsible_amount>#{total_employer_responsible_amount}</total_employer_responsible_amount>
</shop_market>
XMLDOC
  }

  subject { Openhbx::Cv2::PolicyEnrollmentShopMarket.parse(input_xml, single: true) }

  it "has the correct total_employer_responsible_amount" do
    expect(subject.total_employer_responsible_amount).to eq total_employer_responsible_amount
  end

  it "has an employer link" do
    expect(subject.employer_link).to be_a_kind_of(Openhbx::Cv2::EmployerLink)
  end
end
