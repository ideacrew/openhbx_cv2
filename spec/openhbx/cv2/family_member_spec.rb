require "spec_helper"

describe Openhbx::Cv2::FamilyMember, "given a sample xml" do
  let(:member_id) { "some hbx issued member id" }
  let(:primary_family_id) { "some hbx issued family id" }
  let(:tax_household_id) { "some hbx issued tax household id" }
  let(:is_primary_applicant) { "false" }
  let(:is_coverage_applicant) { "true" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<family_member xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <id>
    <id>#{member_id}</id>
  </id>
  <primary_family_id>
    <id>#{primary_family_id}</id>
  </primary_family_id>
  <tax_household_id>
    <id>#{tax_household_id}</id>
  </tax_household_id>
  <person />
  <person_relationships>
    <person_relationship />
    <person_relationship />
  </person_relationships>
  <person_demographics />
  <is_primary_applicant>#{is_primary_applicant}</is_primary_applicant>
  <is_coverage_applicant>#{is_coverage_applicant}</is_coverage_applicant>
  <employee_roles>
    <employee_role />
    <employee_role />
    <employee_role />
  </employee_roles>
</family_member>
XMLDOC
  }

  subject { Openhbx::Cv2::FamilyMember.parse(input_xml, single: true) }

  it "has the correct id" do
    expect(subject.id).to eq member_id
  end

  it "has the correct primary_family_id" do
    expect(subject.primary_family_id).to eq primary_family_id
  end

  it "has the correct tax_household_id" do
    expect(subject.tax_household_id).to eq tax_household_id
  end

  it "has a person" do
    expect(subject.person).to be_kind_of(Openhbx::Cv2::Person)
  end

  it "has a person_demographics" do
    expect(subject.person_demographics).to be_kind_of(Openhbx::Cv2::PersonDemographics)
  end

  it "has 2 person_relationships" do
    expect(subject.person_relationships.length).to eq 2
  end

  it "has the correct is_primary_applicant" do
    expect(subject.is_primary_applicant).to eq is_primary_applicant
  end

  it "has the correct is_coverage_applicant" do
    expect(subject.is_coverage_applicant).to eq is_coverage_applicant
  end

  it "has 3 employee_roles" do
    expect(subject.employee_roles.length).to eq 3
  end

end
