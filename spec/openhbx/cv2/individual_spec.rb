require "spec_helper"

describe Openhbx::Cv2::Individual, "given a sample xml" do
  let(:individual_id) { "Some individual id" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<individual xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{individual_id}</id>
  </id>
  <person />
  <person_demographics />
</individual>
XMLDOC
  }

  subject { Openhbx::Cv2::Individual.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq individual_id
  end

  it "has a person" do
    expect(subject.person).to be_kind_of Openhbx::Cv2::Person
  end

  it "has a person_demographics" do
    expect(subject.person_demographics).to be_kind_of Openhbx::Cv2::PersonDemographics
  end
end
