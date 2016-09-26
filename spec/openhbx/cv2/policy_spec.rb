require "spec_helper"

describe Openhbx::Cv2::Policy, "given a sample xml" do
  let(:policy_id) { "some hbx issued policy id" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<policy xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{policy_id}</id>
  </id>
  <broker />
  <enrollees>
    <enrollee/>
    <enrollee/>
    <enrollee/>
  </enrollees>
  <responsible_party />
  <enrollment />
</policy>
XMLDOC
  }

  subject { Openhbx::Cv2::Policy.parse(input_xml, single: true) }

  it "has the correct policy id" do
    expect(subject.id).to eq policy_id
  end

  it "has a broker link" do
    expect(subject.broker_link).not_to eq nil
  end

  it "has a responsible_party" do
    expect(subject.responsible_party).not_to eq nil
  end

  it "has a policy enrollment" do
    expect(subject.policy_enrollment).not_to eq nil
  end

  it "has the correct number of enrollees" do
    expect(subject.enrollees.length).to eq 3
  end
end
