require "spec_helper"

describe Openhbx::Cv2::PolicyEnrollment, "given a sample xml" do
  let(:premium_total_amount) { "123.45" }
  let(:total_responsible_amount) { "23.45" }
  let(:rating_area) { "SOME RATING AREA NAME" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<enrollment xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <plan />
  <shop_market />
  <individual_market />
  <premium_total_amount>#{premium_total_amount}</premium_total_amount>
  <total_responsible_amount>#{total_responsible_amount}</total_responsible_amount>
  <rating_area>#{rating_area}</rating_area>
  <eligibility_event />
</enrollment>
XMLDOC
  }

  subject { Openhbx::Cv2::PolicyEnrollment.parse(input_xml, single: true) }

  it "has a plan" do
    expect(subject.plan).to be_kind_of(Openhbx::Cv2::PlanLink)
  end

  it "has an eligibility_event" do
    expect(subject.eligibility_event).to be_kind_of(Openhbx::Cv2::EligibilityEvent)
  end

  it "has a shop_market" do
    expect(subject.shop_market).to be_kind_of(Openhbx::Cv2::PolicyEnrollmentShopMarket)
  end

  it "has an individual_market" do
    expect(subject.individual_market).to be_kind_of(Openhbx::Cv2::PolicyEnrollmentIndividualMarket)
  end

  it "has a premium_total_amount" do
    expect(subject.premium_total_amount).to eq premium_total_amount
  end

  it "has a total_responsible_amount" do
    expect(subject.total_responsible_amount).to eq total_responsible_amount
  end

  it "has a rating_area" do
    expect(subject.rating_area).to eq rating_area
  end
end
