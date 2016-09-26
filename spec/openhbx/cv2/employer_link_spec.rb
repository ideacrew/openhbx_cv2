require "spec_helper"

describe Openhbx::Cv2::EmployerLink, "given a sample xml" do
  let(:employer_id) { "employer_id" }
  let(:name) { "employer legal name" }
  let(:dba) { "employer dba" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<employer xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{employer_id}</id>
  </id>
  <name>#{name}</name>
  <dba>#{dba}</dba>
</employer>
XMLDOC
  }

  subject { Openhbx::Cv2::EmployerLink.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq employer_id 
  end

  it "has the correct name" do
    expect(subject.name).to eq name
  end

  it "has the correct dba" do
    expect(subject.dba).to eq dba
  end
end
