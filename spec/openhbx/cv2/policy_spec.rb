require "spec_helper"

describe Openhbx::Cv2::Policy, "given a sample xml" do
  let(:policy_id) { "some hbx issued policy id" }
  let(:previous_policy_id) { "some hbx issued previous policy id" }
  let(:is_reinstate_canceled_policy) { false }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<policy xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{policy_id}</id>
  </id>
  <previous_policy_id>
    <id>#{previous_policy_id}</id>
  </previous_policy_id>
  <is_reinstate_canceled_policy>#{is_reinstate_canceled_policy}</is_reinstate_canceled_policy>
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

  it "has the correct previous_policy_id" do
    expect(subject.previous_policy_id).to eq previous_policy_id
  end

  it "has correct is_reinstate_canceled_policy" do
    expect(subject.is_reinstate_canceled_policy).to eq is_reinstate_canceled_policy
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
