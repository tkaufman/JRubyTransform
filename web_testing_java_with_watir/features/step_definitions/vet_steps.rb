require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new :chrome
end

Given /^I am on the vets page$/ do
  @browser.goto "http://localhost:8080/org.springframework.samples.petclinic/vets"
end

When /^it is displayed$/ do
  Watir::Wait.until {@browser.text.include?("Veterinarians")}
end

Then /^I should see a list of vet names$/ do
  @browser.text.include?("James Carter")
end

Then /^I should see their specialities$/ do
  @browser.text.include?("radiology")
end

Then /^I should see a link to export to XML$/ do
  @browser.link(:text => "View as XML").should exist
end

When /^I click on the XML link$/ do
  @browser.link(:text => "View as XML").click
end

Then /^I should receive an export of the vets in XML$/ do
  @browser.goto("http://localhost:8080/org.springframework.samples.petclinic/vets.xml").should contain("<firstName>James")
end

After do
  @browser.close unless @browser.nil?
end
