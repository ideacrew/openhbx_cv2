require "spec_helper"

describe Openhbx::Cv2::EnrolleeBenefit, "given a sample xml" do
  let(:premium_amount) { "234.34" }
  let(:eligibility_begin_date) { "20150301" }
  let(:begin_date) { "20150324" }
  let(:end_date) { "20151231" }
  let(:coverage_level) { "silver" }
  let(:carrier_assigned_policy_id) { "Carrier Policy ID" }
  let(:carrier_assigned_enrollee_id) { "Carrier Enrollee ID" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<benefit xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <premium_amount>#{premium_amount}</premium_amount>
  <eligibility_begin_date>#{eligibility_begin_date}</eligibility_begin_date>
  <begin_date>#{begin_date}</begin_date>
  <end_date>#{end_date}</end_date>
  <carrier_assigned_policy_id>#{carrier_assigned_policy_id}</carrier_assigned_policy_id>
  <carrier_assigned_enrollee_id>#{carrier_assigned_enrollee_id}</carrier_assigned_enrollee_id>
  <coverage_level>#{coverage_level}</coverage_level>
</benefit>
XMLDOC
  }

  subject { Openhbx::Cv2::EnrolleeBenefit.parse(input_xml, single: true) }

  it "has a premium amount" do
    expect(subject.premium_amount).to eq premium_amount
  end

  it "has a eligibility_begin_date" do
    expect(subject.eligibility_begin_date).to eq eligibility_begin_date
  end

  it "has a begin_date" do
    expect(subject.begin_date).to eq begin_date
  end

  it "has an end_date" do
    expect(subject.end_date).to eq end_date 
  end

  it "has a carrier_assigned_policy_id" do
    expect(subject.carrier_assigned_policy_id).to eq carrier_assigned_policy_id
  end

  it "has a carrier_assigned_enrollee_id" do
    expect(subject.carrier_assigned_enrollee_id).to eq carrier_assigned_enrollee_id
  end

  it "has a coverage_level" do
    expect(subject.coverage_level).to eq coverage_level
  end

end
