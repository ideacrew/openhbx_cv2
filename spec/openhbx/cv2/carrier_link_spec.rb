require "spec_helper"

describe Openhbx::Cv2::CarrierLink, "given a sample xml" do
  let(:carrier_id) { "carrier_id" }
  let(:name) { "carrier name" }
  let(:display_name) { "carrier display name" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<carrier xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{carrier_id}</id>
  </id>
  <name>#{name}</name>
  <display_name>#{display_name}</display_name>
</carrier>
XMLDOC
  }

  subject { Openhbx::Cv2::CarrierLink.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq carrier_id
  end

  it "has the correct name" do
    expect(subject.name).to eq name
  end

  it "has the correct display_name" do
    expect(subject.display_name).to eq display_name
  end
end
