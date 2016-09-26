require "spec_helper"

describe Openhbx::Cv2::PersonDemographics, "given a sample xml" do
  let(:ssn) { "123456789" }
  let(:sex) { "the sex of the member" }
  let(:birth_date) { "20080723" }
  let(:death_date) { "20090114" }
  let(:is_incarcerated) { "nope" }
  let(:language_code) { "welsh for giggles" }
  let(:ethnicity) { "a provided ethnicity" }
  let(:race) { "to the finish line" }
  let(:birth_location) { "whereever" }
  let(:marital_status) { "single" }
  let(:citizen_status) { "us_citizen" }
  let(:is_state_resident) { "true" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<person_demographics xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <ssn>#{ssn}</ssn>
  <sex>#{sex}</sex>
  <birth_date>#{birth_date}</birth_date>
  <death_date>#{death_date}</death_date>
  <is_incarcerated>#{is_incarcerated}</is_incarcerated>
  <language_code>#{language_code}</language_code>
  <ethnicity>#{ethnicity}</ethnicity>
  <race>#{race}</race>
  <birth_location>#{birth_location}</birth_location>
  <marital_status>#{marital_status}</marital_status>
  <citizen_status>#{citizen_status}</citizen_status>
  <is_state_resident>#{is_state_resident}</is_state_resident>
</person_demographics>
XMLDOC
  }

  subject { Openhbx::Cv2::PersonDemographics.parse(input_xml, single: true) }

  it "has the correct ssn" do
    expect(subject.ssn).to eq ssn
  end

  it "has sex" do
    expect(subject.sex).to eq sex
  end

  it "has the correct birth_date" do
    expect(subject.birth_date).to eq birth_date
  end

  it "has the correct death_date" do
    expect(subject.death_date).to eq death_date
  end

  it "has the correct is_incarcerated" do
    expect(subject.is_incarcerated).to eq is_incarcerated
  end

  it "has the correct language_code" do
    expect(subject.language_code).to eq language_code
  end

  it "has the correct ethnicity" do
    expect(subject.ethnicity).to eq ethnicity
  end

  it "has the correct race" do
    expect(subject.race).to eq race
  end

  it "has the correct birth_location" do
    expect(subject.birth_location).to eq birth_location
  end

  it "has the correct marital_status" do
    expect(subject.marital_status).to eq marital_status
  end

  it "has the correct citizen_status" do
    expect(subject.citizen_status).to eq citizen_status
  end

  it "has the correct is_state_resident" do
    expect(subject.is_state_resident).to eq is_state_resident
  end

end
