Feature: Saved Owners
As a user
I want owners to be saved
So that I don't have to re-enter them every time

Scenario: Save an Owner
Given I have "0" owners in the database
When I create an owner
And I save the owner
Then I have "1" owners in the database