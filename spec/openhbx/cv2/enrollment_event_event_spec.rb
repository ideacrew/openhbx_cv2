require "spec_helper"

describe Openhbx::Cv2::EnrollmentEventEvent, "given a sample xml" do
  let(:event_name) { "urn:openhbx:terms:v1:enrollment#initial" }
  let(:resource_instance_id) { "1234987394" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<event xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <event_name>#{event_name}</event_name>
  <header>
    <resource_instance_uri>
      <id>
        <id>#{resource_instance_id}</id>
      </id>
    </resource_instance_uri>
  </header>
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

  it "has the correct enrollment event name" do
    expect(subject.event_name).to eq event_name
  end

  it "has the correct resource_instance_id" do
    expect(subject.resource_instance_id).to eq resource_instance_id
  end
end
