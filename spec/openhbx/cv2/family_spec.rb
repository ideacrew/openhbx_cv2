require "spec_helper"

describe Openhbx::Cv2::Family, "given a sample xml" do
  let(:family_id) { "exchange assigned family id" }
  let(:primary_family_member_id) { "primary_family_member_id" }
  let(:e_case_id) { "an e case id" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<family xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{family_id}</id>
  </id>
  <family_members>
    <family_member/>
    <family_member/>
    <family_member/>
  </family_members>
  <primary_family_member_id>
    <id>#{primary_family_member_id}</id>
  </primary_family_member_id>
  <e_case_id>#{e_case_id}</e_case_id>
  <households>
    <household />
    <household />
  </households>
  <irs_groups>
    <irs_group />
  </irs_groups>
</family>
XMLDOC
  }

  subject { Openhbx::Cv2::Family.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq family_id
  end

  it "has the correct e_case_id" do
    expect(subject.e_case_id).to eq e_case_id
  end

  it "has the primary_family_member_id" do
    expect(subject.primary_family_member_id).to eq primary_family_member_id
  end

  it "has 3 family_members" do
    expect(subject.family_members.length).to eq 3
  end

  it "has 2 households" do
    expect(subject.households.length).to eq 2
  end

  it "has 1 irs_group" do
    expect(subject.irs_groups.length).to eq 1
  end
end
