require "spec_helper"

describe Openhbx::Cv2::BrokerLink, "given a sample xml" do
  let(:broker_npn) { "broker_npn_value" }
  let(:broker_id) { "urn:hbx:some_namespace:npn##{broker_npn}" }
  let(:name) { "A broker name" }
  let(:dba) { "A broker dba" }
  let(:display_name) { "A broker display name" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<broker xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{broker_id}</id>
  </id>
  <name>#{name}</name>
  <dba>#{dba}</dba>
  <display_name>#{display_name}</display_name>
</broker>
XMLDOC
  }

  subject { Openhbx::Cv2::BrokerLink.parse(input_xml, single: true) }

  it "has the correct individual_id" do
    expect(subject.id).to eq broker_id
  end

  it "has the correct name" do
    expect(subject.name).to eq name
  end

  it "has the correct dba" do
    expect(subject.dba).to eq dba
  end

  it "has the correct display_name" do
    expect(subject.display_name).to eq display_name 
  end

  it "extracts the broker npn from the id" do
    expect(subject.npn_from_id).to eq broker_npn
  end
end
