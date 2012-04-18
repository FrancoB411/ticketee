Feature: Only Users with permission can delete tickets.
  In order to prevent tickets being deleted by users without permission
  As ticketee
  I want to let only admins and users with permission see the delete ticket links
  
Background:
  Given there are the following users:
  |  email               |  password  |  admin  |
  |  user@ticketee.com   |  password  |  false  |
  |  admin@ticketee.com  |  password  |  true   |
  
  Given there is a project called "TextMate 2"
  And "user@ticketee.com" can view the "TextMate 2" project
  And "user@ticketee.com" has created a ticket for this project:
    | title   | description                   |
    | Shiny!  | Gradients! Starbursts! Oh my! |
  
Scenario: Delete ticket link is hidden from a user without permission 
  Given I am signed in as "user@ticketee.com"
  And I am on the homepage
  When I follow "TextMate 2"
  And I follow "Shiny!"
  Then I should not see the "Delete" link
  
Scenario: Delete ticket link is shown to admins 
  Given I am signed in as "admin@ticketee.com"
  And I am on the homepage
  When I follow "TextMate 2" 
  And I follow "Shiny!" 
  Then I should see the "Delete" link