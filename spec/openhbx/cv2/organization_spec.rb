require "spec_helper"

describe Openhbx::Cv2::Organization, "given a sample xml" do
  let(:employer_id) { "employer_id" }
  let(:name) { "employer legal name" }
  let(:dba) { "employer dba" }
  let(:fein) { "FEIN12345" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<organization
  xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance'
  xmlns='http://openhbx.org/api/terms/1.0'
  xsi:type='EmployerOrganizationType'>
  <id>
    <id>#{employer_id}</id>
  </id>
  <name>#{name}</name>
  <dba>#{dba}</dba>
  <fein>#{fein}</fein>
  <office_locations>
    <office_location />
    <office_location />
  </office_locations>
  <contacts>
    <contact />
  </contacts>
</organization>
XMLDOC
  }

  subject { Openhbx::Cv2::Organization.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq employer_id 
  end

  it "has the correct name" do
    expect(subject.name).to eq name
  end

  it "has the correct dba" do
    expect(subject.dba).to eq dba
  end

  it "has the correct fein" do
    expect(subject.fein).to eq fein
  end

  it "has 2 office locations" do
    expect(subject.office_locations.length).to eq 2
    expect(subject.office_locations.first.kind_of?(Openhbx::Cv2::OfficeLocation)).to be_truthy
  end


  it "has 1 contact" do
    expect(subject.contacts.length).to eq 1
    expect(subject.contacts.first.kind_of?(Openhbx::Cv2::Contact)).to be_truthy
  end
end
