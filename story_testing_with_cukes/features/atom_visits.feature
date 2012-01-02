Feature: Atom Visits
As a customer
I want an Atom feed of visits
So that I can view them in a reader

Scenario: Single Animal Single Visit
Given a dog named "Luther"
And a visit on "12-21-2011" for "Eating a chicken bone"
When I view the visits in Atom
Then the output should contain "<title>Pet Clinic Visits</title>"
And the output should contain "<title>Luther visit on 2011-12-21</title>
And the output should contain "<summary>Eating a chicken bone</summary>"
