require "spec_helper"

describe Openhbx::Cv2::PlanLink, "given a sample xml" do
  let(:plan_id) { "plan_id" }
  let(:name) { "plan name" }
  let(:active_year) { "2014" }
  let(:is_dental_only) { "false" }
  let(:metal_level) { "false" }
  let(:coverage_type) { "false" }
  let(:ehb_percent) { "0.9189" }
  let(:alias_id_1) { "SOME_NAMESPACE#SOME_ALIAS_ID_1" }
  let(:alias_id_2) { "SOME_NAMESPACE#SOME_ALIAS_ID_2" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<plan xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{plan_id}</id>
    <alias_ids>
      <alias_id>
        <id>#{alias_id_1}</id>
      </alias_id>
      <alias_id>
        <id>#{alias_id_2}</id>
      </alias_id>
    </alias_ids>
  </id>
  <name>#{name}</name>
  <active_year>#{active_year}</active_year>
  <is_dental_only>#{is_dental_only}</is_dental_only>
  <carrier />
  <metal_level>#{metal_level}</metal_level>
  <coverage_type>#{coverage_type}</coverage_type>
  <ehb_percent>#{ehb_percent}</ehb_percent>
</plan>
XMLDOC
  }

  subject { Openhbx::Cv2::PlanLink.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq plan_id 
  end

  it "has the correct name" do
    expect(subject.name).to eq name
  end

  it "has the correct active_year" do
    expect(subject.active_year).to eq active_year
  end

  it "has the correct is_dental_only" do
    expect(subject.is_dental_only).to eq is_dental_only
  end

  it "has a carrier" do
    expect(subject.carrier).to be_kind_of(Openhbx::Cv2::CarrierLink)
  end

  it "has the correct metal_level" do
    expect(subject.metal_level).to eq metal_level
  end

  it "has the correct coverage_type" do
    expect(subject.coverage_type).to eq coverage_type
  end

  it "has the correct ehb_percent" do
    expect(subject.ehb_percent).to eq ehb_percent
  end

  it "has the first alias id" do
    expect(subject.alias_ids).to include alias_id_1
  end

  it "has the second alias id" do
    expect(subject.alias_ids).to include alias_id_2
  end
end

describe Openhbx::Cv2::PlanLink, "given an xml with no alias ids" do
  let(:plan_id) { "plan_id" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<plan xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{plan_id}</id>
  </id>
</plan>
XMLDOC
  }

  subject { Openhbx::Cv2::PlanLink.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq plan_id 
  end

  it "has empty alias ids" do
    expect(subject.alias_ids).to eq []
  end
end
