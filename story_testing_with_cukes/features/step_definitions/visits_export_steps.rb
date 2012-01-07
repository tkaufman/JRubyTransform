require 'java'

java_import org.springframework.samples.petclinic.web.VisitsAtomView
java_import org.springframework.samples.petclinic.Pet
java_import org.springframework.samples.petclinic.PetType
java_import org.springframework.samples.petclinic.Visit

Before do
  @view = VisitsAtomView.new
end

Given /^a dog named "([^"]*)"$/ do |dog_name|
  pet_type = PetType.new
  pet_type.name = "dog"
  @pet = Pet.new
  @pet.name = dog_name
  @pet.type = pet_type
end

Given /^a visit on "([^"]*)" for "([^"]*)"$/ do |str_date, issue|
  @visit = Visit.new
  @visit.pet = @pet
  @visit.date = string_to_date(str_date)
  @visit.description = issue
end

When /^I view the visits in Atom$/ do
  visits = java.util.ArrayList.new
  visits << @visit
  model = java.util.HashMap.new
  model.put("visits", visits)
  @response = org.springframework.mock.web.MockHttpServletResponse.new
  @view.render(model, org.springframework.mock.web.MockHttpServletRequest.new, @response)
end

Then /^the output should contain "([^"]*)"$/ do |text|
  @response.content_as_string.should include(text)
end

def string_to_date (str)
  formatter = java.text.SimpleDateFormat.new("MM-dd-yyyy")
  formatter.parse(str)
end
