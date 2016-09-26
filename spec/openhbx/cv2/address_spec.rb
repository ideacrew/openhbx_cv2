require "spec_helper"

describe Openhbx::Cv2::Address, "given a sample xml" do
  let(:type) { "urn:openhbx:terms:v1:address_type#home" }
  let(:address_line_1) { "123 Some Street" }
  let(:address_line_2) { "Apt. 440" }
  let(:location_city_name) { "Anchorage" }
  let(:location_state_code) { "AK" }
  let(:postal_code) { "99501" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<address xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <type>#{type}</type>
  <address_line_1>#{address_line_1}</address_line_1>
  <address_line_2>#{address_line_2}</address_line_2>
  <location_city_name>#{location_city_name}</location_city_name>
  <location_state_code>#{location_state_code}</location_state_code>
  <postal_code>#{postal_code}</postal_code>
</address>
XMLDOC
  }

  subject { Openhbx::Cv2::Address.parse(input_xml, single: true) }

  it "has the correct type" do
    expect(subject.type).to eq type
  end

  it "has the correct address_line_1" do
    expect(subject.address_line_1).to eq address_line_1
  end

  it "has the correct address_line_2" do
    expect(subject.address_line_2).to eq address_line_2
  end

  it "has the correct location_city_name" do
    expect(subject.location_city_name).to eq location_city_name
  end

  it "has the correct location_state_code" do
    expect(subject.location_state_code).to eq location_state_code
  end

  it "has the correct postal_code" do
    expect(subject.postal_code).to eq postal_code
  end
end
