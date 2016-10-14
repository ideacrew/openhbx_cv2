require "spec_helper"

describe Openhbx::Cv2::IrsGroup, "given a sample xml" do
  let(:irs_group_id) { "exchange assigned irs_group_id" }
  let(:primary_family_member_id) { "primary_family_member_id" }
  let(:tax_household_id_1) { "a tax household id" }
  let(:effective_start_date) { "20060302" }
  let(:effective_end_date) { "20040302" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<irs_group xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{irs_group_id}</id>
  </id>
  <tax_household_ids>
    <tax_household_id>
      <id>#{tax_household_id_1}</id>
    </tax_household_id>
    <tax_household_id>
      <id></id>
    </tax_household_id>
  </tax_household_ids>
  <effective_start_date>#{effective_start_date}</effective_start_date>
  <effective_end_date>#{effective_end_date}</effective_end_date>
</irs_group>
XMLDOC
  }

  subject { Openhbx::Cv2::IrsGroup.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq irs_group_id
  end

  it "has the correct effective_start_date" do
    expect(subject.effective_start_date).to eq effective_start_date
  end

  it "has the correct effective_end_date" do
    expect(subject.effective_end_date).to eq effective_end_date
  end

  it "has the 2 tax household ids" do
    expect(subject.tax_household_ids.length).to eq 2
  end

  it "has the correct first tax household id" do
    expect(subject.tax_household_ids.first).to eq tax_household_id_1
  end
end
