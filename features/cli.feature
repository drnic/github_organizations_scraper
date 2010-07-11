Feature: Command line interface
  In order to pull down results quickly via commandline
  As a CLI user
  I want a CLI tool

  Scenario: Display members of a github organization
    Given a github organization "engineyard"
    When I run local executable "github_organization" with arguments "engineyard"
    Then I should see "wycats - Yehuda Katz"
    Then I should see "daksis - Randall Thomas"
  
  Scenario: Display error for normal github user
    Given a github user "drnic"
    When I run local executable "github_organization" with arguments "drnic"
    Then I should see "'drnic' is a github user account; not an organization account."
  
  Scenario: Display error for non-existent github account
    When I run local executable "github_organization" with arguments "foobar"
    Then I should see "'foobar' is not a github account."
  
  
  
  
  
