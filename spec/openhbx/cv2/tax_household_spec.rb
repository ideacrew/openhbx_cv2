require "spec_helper"

describe Openhbx::Cv2::TaxHousehold, "given a sample xml" do
  let(:household_id) { "exchange assigned tax_household_id" }
  let(:primary_applicant_id) { "primary_member_id" }
  let(:start_date) { "20060302" }
  let(:end_date) { "20040302" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<tax_household xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{household_id}</id>
  </id>
  <primary_applicant_id>
    <id>#{primary_applicant_id}</id>
  </primary_applicant_id>
  <tax_household_members>
    <tax_household_member />
    <tax_household_member />
  </tax_household_members>
  <start_date>#{start_date}</start_date>
  <end_date>#{end_date}</end_date>
</tax_household>
XMLDOC
  }

  subject { Openhbx::Cv2::TaxHousehold.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq household_id
  end

  it "has the correct primary_applicant_id" do
    expect(subject.primary_applicant_id).to eq primary_applicant_id
  end

  it "has the correct start_date" do
    expect(subject.start_date).to eq start_date
  end

  it "has the correct end_date" do
    expect(subject.end_date).to eq end_date
  end

  it "has 2 tax_household_members" do
    expect(subject.tax_household_members.length).to eq 2
  end
end
