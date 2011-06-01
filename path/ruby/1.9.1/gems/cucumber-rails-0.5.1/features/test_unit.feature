Feature: Run with Test::Unit

  Scenario: Delete a widget
    Given I have created a new Rails 3 app "widgets" with cucumber-rails support
    And I overwrite "Gemfile" with:
       """
       gem 'rails'
       gem 'sqlite3'
       gem "cucumber-rails", :group => :test, :path => "../../.."
       gem "capybara", :group => :test
       gem "database_cleaner", :group => :test
       gem 'factory_girl', :group => :test

       """
    And I successfully run `rails generate scaffold widget name:string`
    And I write to "features/f.feature" with:
      """
      Feature: Widget inventory
        Scenario: Delete a widget
          Given there is a widget named "wrench"
          When I go to the widgets page
          Then I should see "wrench"
      """
    And I write to "features/step_definitions/s.rb" with:
      """
      Given /^there is a widget named "([^"]*)"$/ do |name|
        Factory(:widget, :name => name)
      end
      """
    And I write to "features/support/factories.rb" with:
      """
      Factory.define :widget do |f| 
        f.name 'testwidget'
      end
      """
    When I run `rake db:migrate cucumber`
    Then it should pass with:
       """
       1 scenario (1 passed)
       3 steps (3 passed)
       """

