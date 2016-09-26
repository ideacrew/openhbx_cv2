require "spec_helper"

describe Openhbx::Cv2::ResponsibleParty, "given a sample xml" do
  let(:person_id) { "some hbx issued broker id" }
  let(:name_prefix) { "Dr." }
  let(:first_name) { "Totally" }
  let(:middle_name) { "Responsible" }
  let(:last_name) { "Party" }
  let(:name_suffix) { "M.C." }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<responsible_party xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
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
</responsible_party>
XMLDOC
  }

  subject { Openhbx::Cv2::ResponsibleParty.parse(input_xml, single: true) }

  it "has the correct individual_id" do
    expect(subject.id).to eq person_id
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
