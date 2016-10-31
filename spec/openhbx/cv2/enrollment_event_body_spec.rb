require "spec_helper"

describe Openhbx::Cv2::EnrollmentEventBody, "given a sample xml" do
  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<enrollment_event_body xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <enrollment />
</enrollment_event_body>
XMLDOC
  }

  subject { Openhbx::Cv2::EnrollmentEventBody.parse(input_xml, single: true) }

  it "has the correct policy id" do
    expect(subject.enrollment).to be_kind_of Openhbx::Cv2::Enrollment
  end
end
