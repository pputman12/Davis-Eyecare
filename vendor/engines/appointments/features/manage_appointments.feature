@appointments
Feature: Appointments
  In order to have appointments on my website
  As an administrator
  I want to manage appointments

  Background:
    Given I am a logged in refinery user
    And I have no appointments

  @appointments-list @list
  Scenario: Appointments List
   Given I have appointments titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of appointments
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @appointments-valid @valid
  Scenario: Create Valid Appointment
    When I go to the list of appointments
    And I follow "Add New Appointment"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 appointment

  @appointments-invalid @invalid
  Scenario: Create Invalid Appointment (without name)
    When I go to the list of appointments
    And I follow "Add New Appointment"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 appointments

  @appointments-edit @edit
  Scenario: Edit Existing Appointment
    Given I have appointments titled "A name"
    When I go to the list of appointments
    And I follow "Edit this appointment" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of appointments
    And I should not see "A name"

  @appointments-duplicate @duplicate
  Scenario: Create Duplicate Appointment
    Given I only have appointments titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of appointments
    And I follow "Add New Appointment"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 appointments

  @appointments-delete @delete
  Scenario: Delete Appointment
    Given I only have appointments titled UniqueTitleOne
    When I go to the list of appointments
    And I follow "Remove this appointment forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 appointments
 