require "spec_helper"

describe Openhbx::Cv2::EnrollmentEventHeader, "given a sample xml" do
  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<header xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <submitted_timestamp>#{submitted_timestamp}</submitted_timestamp>
</header>
XMLDOC
  }

  let(:submitted_timestamp) { "A TIMESTAMP" }

  subject { Openhbx::Cv2::EnrollmentEventHeader.parse(input_xml, single: true) }

  it "has the correct timestamp" do
    expect(subject.submitted_timestamp).to eq(submitted_timestamp)
  end
end
