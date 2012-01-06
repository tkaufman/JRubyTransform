require 'java'
require 'gimme'

java_import org.springframework.samples.petclinic.web.VisitsAtomView
java_import org.springframework.samples.petclinic.Pet
java_import org.springframework.samples.petclinic.PetType
java_import org.springframework.samples.petclinic.Visit
java_import com.sun.syndication.feed.atom.Feed

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
  model = java.util.HashMap.new
  model.put("visits", @visit)
  @feed = Feed.new
  @view.buildFeedMetadata(model, @feed, org.springframework.mock.web.MockHttpServletRequest.new)
end

Then /^the output should contain "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the output should contain "<title>Luther visit on (\d+)\-(\d+)\-(\d+)<\/title>$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

def string_to_date (str)
  formatter = java.text.SimpleDateFormat.new("MM-dd-yyyy") 
  formatter.parse(str)
end
