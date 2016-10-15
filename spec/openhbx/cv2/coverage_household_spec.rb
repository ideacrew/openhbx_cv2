require "spec_helper"

describe Openhbx::Cv2::CoverageHousehold, "given a sample xml" do
  let(:household_id) { "exchange assigned coverage_household_id" }
  let(:primary_member_id) { "primary_member_id" }
  let(:start_date) { "20060302" }
  let(:end_date) { "20040302" }
  let(:immediate_family) { "true" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<coverage_household xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{household_id}</id>
  </id>
  <start_date>#{start_date}</start_date>
  <end_date>#{end_date}</end_date>
  <is_immediate_family>#{immediate_family}</is_immediate_family>
  <coverage_household_members>
    <coverage_household_member />
    <coverage_household_member />
    <coverage_household_member />
  </coverage_household_members>
  <primary_member_id>
    <id>#{primary_member_id}</id>
  </primary_member_id>
</coverage_household>
XMLDOC
  }

  subject { Openhbx::Cv2::CoverageHousehold.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq household_id
  end

  it "has the correct is_immediate_family" do
    expect(subject.is_immediate_family).to eq immediate_family
  end

  it "has the correct primary_member_id" do
    expect(subject.primary_member_id).to eq primary_member_id
  end

  it "has the correct start_date" do
    expect(subject.start_date).to eq start_date
  end

  it "has the correct end_date" do
    expect(subject.end_date).to eq end_date
  end

  it "should have 3 coverage_household_members" do
    expect(subject.coverage_household_members.length).to eq 3
  end
end
