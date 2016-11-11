require "spec_helper"

describe Openhbx::Cv2::EnrollmentEventBody, "given a sample xml" do
  let(:transaction_id) { "A transaction id" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<enrollment_event_body xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <affected_members>
    <affected_member/>
    <affected_member/>
  </affected_members>
  <transaction_id>#{transaction_id}</transaction_id>
  <enrollment/>
</enrollment_event_body>
XMLDOC
  }

  subject { Openhbx::Cv2::EnrollmentEventBody.parse(input_xml, single: true) }

  it "has 2 affected members" do
    expect(subject.affected_members.length).to eq 2
  end

  it "has an enrollment" do
    expect(subject.enrollment).to be_kind_of Openhbx::Cv2::Enrollment
  end

  it "has a transaction id" do
    expect(subject.transaction_id).to eq transaction_id
  end
end
