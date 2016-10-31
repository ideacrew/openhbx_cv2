require "spec_helper"

describe Openhbx::Cv2::EnrollmentEventEvent, "given a sample xml" do
  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<event xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <body>
    <enrollment_event_body />
  </body>
</event>
XMLDOC
  }

  subject { Openhbx::Cv2::EnrollmentEventEvent.parse(input_xml, single: true) }

  it "has the correct policy id" do
    expect(subject.body).to be_kind_of Openhbx::Cv2::EnrollmentEventBody
  end
end
