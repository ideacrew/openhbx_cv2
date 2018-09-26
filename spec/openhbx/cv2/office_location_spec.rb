require "spec_helper"

describe Openhbx::Cv2::OfficeLocation, "given a sample xml" do
  let(:office_location_id) { "office_location_id" }
  let(:name) { "office_location name" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<office_location xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{office_location_id}</id>
  </id>
  <name>#{name}</name>
  <primary>true</primary>
  <address />
  <phone />
</office_location>
XMLDOC
  }

  subject { Openhbx::Cv2::OfficeLocation.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq office_location_id
  end

  it "has the correct name" do
    expect(subject.name).to eq name
  end

  it "has the correct is_primary" do
    expect(subject.is_primary).to be_truthy
  end

  it "has one address" do
    expect(subject.address.kind_of?(Openhbx::Cv2::Address)).to be_truthy
  end

  it "has one phone" do
    expect(subject.phone.kind_of?(Openhbx::Cv2::Phone)).to be_truthy
  end
end
