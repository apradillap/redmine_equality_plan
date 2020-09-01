# Redmine Equality Plan

With this redmine plugin we want to quickly add an "Equality Plan" to companies using redmine.

<a href="https://codeclimate.com/github/apradillap/redmine_equality_plan/maintainability"><img src="https://api.codeclimate.com/v1/badges/75bc2ecffcb7e3b4cc91/maintainability" /></a>

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
```
rake gender:populate_user_gender
rake gender:populate_gender_stories
```

6. Access to /gender_stories

## Compatibility

* Redmine 4.1.1 (2020-04-06)
* Easy Redmine from 7.06 to 10.3.1 (2020-06-24)

It will probably be compatible with previous versions of Redmine. If you try it, let us know


## Libraries/gems being used

* Gems: See [Gemfile](https://github.com/apradillap/redmine_equality_plan/blob/master/Gemfile) for complete reference
* Other (CSS, JS): #ToDo (browse source meanwhile ;)
