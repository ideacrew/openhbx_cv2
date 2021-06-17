require "spec_helper"

describe Openhbx::Cv2::PersonHealth, "given a sample xml, with all tags" do
  let(:is_disabled) { "false" }
  let(:is_tobacco_user) { "true" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
  <person_health xmlns='http://openhbx.org/api/terms/1.0'>
    <is_disabled>#{is_disabled}</is_disabled>
    <is_tobacco_user>#{is_tobacco_user}</is_tobacco_user>
  </person_health>
XMLDOC
  }

  subject { Openhbx::Cv2::PersonHealth.parse(input_xml, single: true) }


  it "does not have is_disabled" do
    expect(subject.disability_value).to be_falsey
  end

  it "has is tobacco user" do
    expect(subject.is_tobacco_user).to eq "true"
  end

  it "has tobacco use value Y" do
    expect(subject.tobacco_use_value).to eq "Y"
  end
end

describe Openhbx::Cv2::PersonHealth, "given a sample xml, with no tobacco or disability information" do
  let(:is_disabled) { "false" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
  <person_health xmlns='http://openhbx.org/api/terms/1.0'>
  </person_health>
XMLDOC
  }

  subject { Openhbx::Cv2::PersonHealth.parse(input_xml, single: true) }

  it "does not have is_disabled" do
    expect(subject.disability_value).to eq false
  end

  it "has tobacco use value nil" do
    expect(subject.tobacco_use_value).to eq nil
  end
end

describe Openhbx::Cv2::PersonHealth, "given a sample xml, with unknown tobacco and true disability" do
  let(:is_disabled) { "true" }
  let(:is_tobacco_user) { "unknown" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
  <person_health xmlns='http://openhbx.org/api/terms/1.0'>
    <is_disabled>#{is_disabled}</is_disabled>
    <is_tobacco_user>#{is_tobacco_user}</is_tobacco_user>
  </person_health>
XMLDOC
  }

  subject { Openhbx::Cv2::PersonHealth.parse(input_xml, single: true) }

  it "does have is_disabled" do
    expect(subject.disability_value).to be_truthy
  end

  it "has tobacco use value nil" do
    expect(subject.tobacco_use_value).to eq nil
  end
end

describe Openhbx::Cv2::PersonHealth, "given a sample xml, with no for tobacco and true disability" do
  let(:is_disabled) { "true" }
  let(:is_tobacco_user) { "false" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
  <person_health xmlns='http://openhbx.org/api/terms/1.0'>
    <is_disabled>#{is_disabled}</is_disabled>
    <is_tobacco_user>#{is_tobacco_user}</is_tobacco_user>
  </person_health>
XMLDOC
  }

  subject { Openhbx::Cv2::PersonHealth.parse(input_xml, single: true) }

  it "does has is_disabled" do
    expect(subject.disability_value).to be_truthy
  end

  it "has tobacco use value 'N'" do
    expect(subject.tobacco_use_value).to eq 'N'
  end
end