Feature: Command line interface
  In order to pull down results quickly via commandline
  As a CLI user
  I want a CLI tool

  Scenario: Display members of a github organization
    Given a github organization "engineyard"
    When I run the executable with arguments "engineyard"
    Then I should see "wycats, Yehuda Katz, 69 public repos, 998 followers"
    Then I should see "tpoland, 1 public repos, 0 followers"
  
  Scenario: Display error for normal github user
    Given a github user "drnic"
    When I run the executable with arguments "drnic"
    Then I should see "'drnic' is a github user account; not an organization account."
  
  Scenario: Display error for non-existent github account
  When I run the executable with arguments "foobar"
    Then I should see "'foobar' is not a github account."
  
  
  
  
  
