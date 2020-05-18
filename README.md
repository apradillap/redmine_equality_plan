# Redmine Equality Plan

With this redmine plugin we want to quickly add an "Equality Plan" to companies using redmine.

## Installation
1. To run the migrations run:
  ```
  rake redmine:plugins:migrate
  ```
2. Generates the configuration file:
  ```
  cp config/configuration.yml.example config/configuration.yml
  ```
3. It defines the id of the Custom Field that will reflect the gender of the user in
   config/configuration.yml

4. Define custom values and custom method (view example files)

5. Execute populate_user_gender and populate_gender_stories tasks

## Libraries/gems being used

* Gems: See [Gemfile](https://github.com/apradillap/redmine_equality_plan/blob/master/Gemfile) for complete reference
* Other (CSS, JS): #ToDo (browse source meanwhile ;)
