require "spec_helper"

describe Openhbx::Cv2::PersonRelationship, "given a sample xml" do
  let(:subject_individual) { "subject individual id" }
  let(:relationship_uri) { "parent" }
  let(:inverse_relationship_uri) { "child" }
  let(:object_individual) { "object individual id" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<person_relationship xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <subject_individual>#{subject_individual}</subject_individual>
  <relationship_uri>#{relationship_uri}</relationship_uri>
  <inverse_relationship_uri>#{inverse_relationship_uri}</inverse_relationship_uri>
  <object_individual>#{object_individual}</object_individual>
</person_relationship>
XMLDOC
  }

  subject { Openhbx::Cv2::PersonRelationship.parse(input_xml, single: true) }

  it "has the correct subject_individual" do
    expect(subject.subject_individual).to eq subject_individual
  end

  it "has the correct object_individual" do
    expect(subject.object_individual).to eq object_individual 
  end

  it "has the correct relationship_uri" do
    expect(subject.relationship_uri).to eq relationship_uri
  end

  it "has the correct inverse_relationship_uri" do
    expect(subject.inverse_relationship_uri).to eq inverse_relationship_uri
  end
end
