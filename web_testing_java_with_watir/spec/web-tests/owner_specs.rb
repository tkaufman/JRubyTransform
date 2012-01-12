require 'watir-webdriver'

describe 'Spring PetClinic Owners' do
  before(:all) do
    @browser = Watir::Browser.new :chrome
  end

  describe '(adding)' do
    before(:each) do
      @browser.goto "http://localhost:8080/org.springframework.samples.petclinic/owners/new"
    end

    it 'should require all fields' do
      @browser.button(:value => 'Add Owner').click
      @browser.text().should include('First Name: is required')
      @browser.text().should include('Last Name: is required')
      @browser.text().should include('Address: is required')
      @browser.text().should include('City: is required')
      @browser.text().should include('Telephone: is required')
    end

    it 'should display updated owners' do
      @browser.text_field(:id => 'firstName').set("Todd")
      @browser.text_field(:id => 'lastName').set("Kaufman")
      @browser.text_field(:id => 'address').set("5562 Alston Grove Dr")
      @browser.text_field(:id => 'city').set("Westerville")
      @browser.text_field(:id => 'telephone').set("6145658132")
      @browser.button(:value => 'Add Owner').click
      @browser.text().should include("Todd Kaufman")
    end
  end

  describe '(finding)' do
    before(:each) do
      @browser.goto "http://localhost:8080/org.springframework.samples.petclinic/owners/search"
    end

    it 'should find by last name' do
      @browser.text_field(:id => 'lastName').set("Franklin")
      @browser.button(:value => 'Find Owners').click
      @browser.text().should include("George Franklin")
    end

    it 'should find by partial name' do
      @browser.text_field(:id => 'lastName').set("Fran")
      @browser.button(:value => 'Find Owners').click
      @browser.text().should include("George Franklin")
    end

    it 'should find all when nothing is supplied' do
      @browser.button(:value => 'Find Owners').click
      @browser.text().should include("George Franklin")
    end
  end

  after(:all) do
    @browser.close unless @browser.nil?
  end
end
