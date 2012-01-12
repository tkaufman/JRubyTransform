require 'java'

java_import org.springframework.context.ApplicationContext
java_import org.springframework.context.support.ClassPathXmlApplicationContext
java_import org.springframework.samples.petclinic.Clinic

Before do
  context_locations = []
  context_locations << "org/springframework/samples/petclinic/AbstractClinicTests-context.xml"
  context_locations << "org/springframework/samples/petclinic/jdbc/SimpleJdbcClinicTests-context.xml"
  ApplicationContext context = ClassPathXmlApplicationContext.new(context_locations.to_java(:string))
  Clinic @clinic = context.getBean("beerCounter", Clinic.class)
end

Given /^I have "([^"]*)" owners in the database$/ do |num_owners|
  pending # express the regexp above with the code you wish you had
end

When /^I create an owner$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I save the owner$/ do
  pending # express the regexp above with the code you wish you had
end