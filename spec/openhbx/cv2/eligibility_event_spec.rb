require "spec_helper"

describe Openhbx::Cv2::EligibilityEvent, "given a sample xml" do
  let(:event_kind) { "A BABY!" }
  let(:event_date) { "SOON" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<eligibility_event xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <event_kind>#{event_kind}</event_kind>
  <event_date>#{event_date}</event_date>
</eligibility_event>
XMLDOC
  }

  subject { Openhbx::Cv2::EligibilityEvent.parse(input_xml, single: true) }

  it "has the correct event_kind" do
    expect(subject.event_kind).to eq event_kind
  end

  it "has the correct event_date" do
    expect(subject.event_date).to eq event_date
  end
end
