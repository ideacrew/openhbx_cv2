require "spec_helper"

describe Openhbx::Cv2::Enrollment, "given a sample xml" do
  let(:enrollment_type) { "urn:openhbx:terms:v1:enrollment#initial" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<enrollment xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <type>#{enrollment_type}</type>
  <policy />
</enrollment>
XMLDOC
  }

  subject { Openhbx::Cv2::Enrollment.parse(input_xml, single: true) }

  it "has the correct policy id" do
    expect(subject.policy).to be_kind_of Openhbx::Cv2::Policy
  end

  it "has the correct type" do
    expect(subject.enrollment_type).to eq enrollment_type
  end
end
