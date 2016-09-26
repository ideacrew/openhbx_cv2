require "spec_helper"

describe Openhbx::Cv2::EnrolleeMember, "given a sample xml" do
  let(:member_id) { "some hbx issued member id" }
  let(:primary_family_id) { "some hbx issued family id" }
  let(:tax_household_id) { "some hbx issued tax household id" }
  let(:is_primary_applicant) { "false" }
  let(:is_coverage_applicant) { "true" }
  let(:is_without_assistance) { "true" }
  let(:is_enrolled_in_employer_sponsored_coverage) { "true" }
  let(:is_insurance_assistance_eligible) { "false" }
  let(:is_medicaid_chip_eligible) { "false" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<member xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
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
  <is_without_assistance>#{is_without_assistance}</is_without_assistance>
  <is_enrolled_in_employer_sponsored_coverage>#{is_enrolled_in_employer_sponsored_coverage}</is_enrolled_in_employer_sponsored_coverage>
  <is_insurance_assistance_eligible>#{is_insurance_assistance_eligible}</is_insurance_assistance_eligible>
  <is_medicaid_chip_eligible>#{is_medicaid_chip_eligible}</is_medicaid_chip_eligible>
</member>
XMLDOC
  }

  subject { Openhbx::Cv2::EnrolleeMember.parse(input_xml, single: true) }

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

  it "has the correct is_without_assistance" do
    expect(subject.is_without_assistance).to eq is_without_assistance
  end

  it "has the correct is_enrolled_in_employer_sponsored_coverage" do
    expect(subject.is_enrolled_in_employer_sponsored_coverage).to eq is_enrolled_in_employer_sponsored_coverage
  end

  it "has the correct is_insurance_assistance_eligible" do
    expect(subject.is_insurance_assistance_eligible).to eq is_insurance_assistance_eligible 
  end

  it "has the correct is_medicaid_chip_eligible" do
    expect(subject.is_medicaid_chip_eligible).to eq is_medicaid_chip_eligible 
  end

  it "has 3 employee_roles" do
    expect(subject.employee_roles.length).to eq 3
  end

end
