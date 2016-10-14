require "spec_helper"

describe Openhbx::Cv2::FamilyHousehold, "given a sample xml" do
  let(:household_id) { "exchange assigned household_id" }
  let(:irs_group_id) { "exchange assigned irs_group_id" }
  let(:primary_family_member_id) { "primary_family_member_id" }
  let(:tax_household_id_1) { "a tax household id" }
  let(:start_date) { "20060302" }
  let(:end_date) { "20040302" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<household xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{household_id}</id>
  </id>
  <irs_group_id>#{irs_group_id}</irs_group_id>
  <start_date>#{start_date}</start_date>
  <end_date>#{end_date}</end_date>
  <coverage_households>
    <coverage_household/>
    <coverage_household/>
  </coverage_households>
  <tax_households>
    <tax_household/>
    <tax_household/>
    <tax_household/>
  </tax_households>
</household>
XMLDOC
  }

  subject { Openhbx::Cv2::FamilyHousehold.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq household_id
  end

  it "has the correct irs_group_id" do
    expect(subject.irs_group_id).to eq irs_group_id
  end

  it "has the correct start_date" do
    expect(subject.start_date).to eq start_date
  end

  it "has the correct end_date" do
    expect(subject.end_date).to eq end_date
  end

  it "has 2 coverage_households" do
    expect(subject.coverage_households.length).to eq 2
  end

  it "has 3 tax_households" do
    expect(subject.tax_households.length).to eq 3
  end
end
