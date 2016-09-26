require "spec_helper"

describe Openhbx::Cv2::PreviousIndividualInformation, "given a sample xml" do
  let(:name_prefix) { "Mr. Dr." }
  let(:first_name) { "Super Totally" }
  let(:middle_name) { "Awesomeness" }
  let(:last_name) { "Extreme" }
  let(:name_suffix) { "PHD" }
  let(:gender) { "M" }
  let(:dob) { "20120312" }
  let(:ssn) { "123456789" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<previous_individual_information xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <name_prefix>#{name_prefix}</name_prefix>
  <name_first>#{first_name}</name_first>
  <name_middle>#{middle_name}</name_middle>
  <name_last>#{last_name}</name_last>
  <name_suffix>#{name_suffix}</name_suffix>
  <gender>#{gender}</gender>
  <dob>#{dob}</dob>
  <ssn>#{ssn}</ssn>
</previous_individual_information>
XMLDOC
  }

  subject { Openhbx::Cv2::PreviousIndividualInformation.parse(input_xml, single: true) }

  it "has the correct name_prefix value" do
    expect(subject.name_prefix).to eq name_prefix
  end

  it "has the correct name_first value" do
    expect(subject.name_first).to eq first_name
  end

  it "has the correct name_last value" do
    expect(subject.name_last).to eq last_name
  end

  it "has the correct name_middle value" do
    expect(subject.name_middle).to eq middle_name
  end

  it "has the correct name_suffix value" do
    expect(subject.name_suffix).to eq name_suffix
  end

  it "has the correct gender value" do
    expect(subject.gender).to eq gender
  end

  it "has the correct dob value" do
    expect(subject.dob).to eq dob
  end

  it "has the correct ssn value" do
    expect(subject.ssn).to eq ssn
  end
end
