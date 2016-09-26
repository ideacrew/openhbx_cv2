require "spec_helper"

describe Openhbx::Cv2::Person, "given a sample xml" do
  let(:person_id) { "exchange assigned person id" }
  let(:job_title) { "person job title" }
  let(:department) { "person department" }
  let(:name_prefix) { "Dr." }
  let(:first_name) { "Totally" }
  let(:middle_name) { "Some" }
  let(:last_name) { "Person" }
  let(:name_suffix) { "M.C." }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<person xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{person_id}</id>
  </id>
  <person_name>
    <person_surname>#{last_name}</person_surname>
    <person_given_name>#{first_name}</person_given_name>
    <person_middle_name>#{middle_name}</person_middle_name>
    <person_name_prefix_text>#{name_prefix}</person_name_prefix_text>
    <person_name_suffix_text>#{name_suffix}</person_name_suffix_text>
  </person_name>
  <job_title>#{job_title}</job_title>
  <department>#{department}</department>
  <addresses>
    <address/>
  </addresses>
  <emails>
    <email/>
    <email/>
  </emails>
  <phones>
    <phone/>
    <phone/>
    <phone/>
  </phones>
</person>
XMLDOC
  }

  subject { Openhbx::Cv2::Person.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq person_id
  end

  it "has the correct job_title" do
    expect(subject.job_title).to eq job_title
  end

  it "has the correct department" do
    expect(subject.department).to eq department
  end

  it "has the correct name_prefix" do
    expect(subject.name_prefix).to eq name_prefix
  end

  it "has the correct first_name" do
    expect(subject.first_name).to eq first_name
  end

  it "has the correct middle_name" do
    expect(subject.middle_name).to eq middle_name
  end

  it "has the correct last_name" do
    expect(subject.last_name).to eq last_name
  end

  it "has the correct name_suffix" do
    expect(subject.name_suffix).to eq name_suffix
  end

  it "has one address" do
    expect(subject.addresses.length).to eq 1
  end

  it "has two emails" do
    expect(subject.emails.length).to eq 2
  end

  it "has three phones" do
    expect(subject.phones.length).to eq 3
  end
end
