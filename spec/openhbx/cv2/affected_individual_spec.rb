require "spec_helper"

describe Openhbx::Cv2::AffectedIndividual, "given a sample xml" do
  let(:individual_id) { "some hbx issued individual id" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<affected_individual xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <individual_id>#{individual_id}</individual_id>
  <previous_individual_information/>
</affected_individual>
XMLDOC
  }

  subject { Openhbx::Cv2::AffectedIndividual.parse(input_xml, single: true) }

  it "has the correct individual_id" do
    expect(subject.individual_id).to eq individual_id
  end

  it "has one previous_individual_information" do
    expect(subject.previous_individual_information).not_to eq nil
  end
end
