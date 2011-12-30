Feature: Display Vets
As a customer
I want to see a list of veterinarians
So that I can choose one to attend to my pet

Scenario: List Vets
Given I am on the vets page
When it is displayed
Then I should see a list of vet names
And I should see their specialities

Scenario: XML Vets
Given I am on the vets page
When it is displayed
Then I should see a link to export to XML

Scenario: Export Vets
Given I am on the vets page
When I click on the XML link
Then I should receive an export of the vets in XML
