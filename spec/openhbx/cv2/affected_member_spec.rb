require "spec_helper"

describe Openhbx::Cv2::AffectedMember, "given a sample xml" do
  let(:member_id) { "A member id" }
  let(:is_subscriber) { "false" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<affected_member xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <member>
    <id>
      <id>#{member_id}</id>
    </id>
  </member>
  <is_subscriber>#{is_subscriber}</is_subscriber>
</affected_member>
XMLDOC
  }

  subject { Openhbx::Cv2::AffectedMember.parse(input_xml, single: true) }

  it "has the correct member id" do
    expect(subject.id).to eq member_id
  end

  it "has the correct is subscriber" do
    expect(subject.is_subscriber).to eq is_subscriber
  end

  it "has a member" do
    expect(subject.member).to be_kind_of(::Openhbx::Cv2::EnrolleeMember)
  end
end
