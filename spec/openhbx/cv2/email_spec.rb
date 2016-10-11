require "spec_helper"

describe Openhbx::Cv2::Email, "given a sample xml" do
  let(:email_type) { "urn:openhbx:terms:v1:email_type#home" }
  let(:email_address) { "dude@place.com" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<email xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <type>#{email_type}</type>
  <email_address>#{email_address}</email_address>
</email>
XMLDOC
  }

  subject { Openhbx::Cv2::Email.parse(input_xml, single: true) }

  it "has the correct type" do
    expect(subject.type).to eq email_type
  end

  it "has the email_address" do
    expect(subject.email_address).to eq email_address
  end
end
