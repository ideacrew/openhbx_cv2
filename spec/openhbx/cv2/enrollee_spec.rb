require "spec_helper"

describe Openhbx::Cv2::Enrollee, "given a sample xml" do
  let(:subscriber_flag) { "TrUe" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<enrollee xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <member />
  <is_subscriber>#{subscriber_flag}</is_subscriber>
  <benefit />
</enrollee>
XMLDOC
  }

  subject { Openhbx::Cv2::Enrollee.parse(input_xml, single: true) }

  it "has the correct subscriber flag" do
    expect(subject.subscriber?).to be_truthy
  end

  it "has a member" do
    expect(subject.member).not_to be nil
  end

  it "has a benefit" do
    expect(subject.benefit).not_to be nil
  end

end
