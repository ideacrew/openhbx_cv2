require "spec_helper"

describe Openhbx::Cv2::Phone, "given a sample xml" do
  let(:phone_type) { "urn:openhbx:terms:v1:phone_type#home" }
  let(:full_phone_number) { "1234567689" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<phone xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <type>#{phone_type}</type>
  <full_phone_number>#{full_phone_number}</full_phone_number>
</phone>
XMLDOC
  }

  subject { Openhbx::Cv2::Phone.parse(input_xml, single: true) }

  it "has the correct type" do
    expect(subject.type).to eq phone_type
  end

  it "has the full_phone_number" do
    expect(subject.full_phone_number).to eq full_phone_number
  end
end
