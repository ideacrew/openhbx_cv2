require "spec_helper"

describe Openhbx::Cv2::Individual, "given a sample xml" do
  let(:individual_id) { "Some individual id" }
  let(:created_at_value) { 
    dt_value = DateTime.now - 1000
    Time.mktime(dt_value.year, dt_value.month, dt_value.day, dt_value.hour, dt_value.minute, dt_value.second)
  }
  let(:updated_at_value) { 
    dt_value = DateTime.now
    Time.mktime(dt_value.year, dt_value.month, dt_value.day, dt_value.hour, dt_value.minute, dt_value.second)
  }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<individual xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{individual_id}</id>
  </id>
  <person />
  <person_demographics />
  <created_at>#{created_at_value.iso8601}</created_at>
  <updated_at>#{updated_at_value.iso8601}</updated_at>
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

  it "has the correct updated_at" do
    expect(subject.updated_at).to eq updated_at_value
  end

  it "has the correct created_at" do
    expect(subject.created_at).to eq created_at_value
  end
end
