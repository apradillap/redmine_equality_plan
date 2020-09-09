[![Build Status](https://travis-ci.org/apradillap/redmine_equality_plan.svg?branch=master)](https://travis-ci.org/apradillap/redmine_equality_plan)
<a href="https://codeclimate.com/github/apradillap/redmine_equality_plan/maintainability"><img src="https://api.codeclimate.com/v1/badges/75bc2ecffcb7e3b4cc91/maintainability" /></a>
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)
[![Help wanted](https://img.shields.io/badge/help-wanted-brightgreen.svg?style=flat-square)](https://github.com/apradillap/redmine_equality_plan/issues?q=is%3Aissue+is%3Aopen+label%3A"help+wanted")
[![Coverage Status](https://coveralls.io/repos/github/apradillap/redmine_equality_plan/badge.svg?branch=master)](https://coveralls.io/github/apradillap/redmine_equality_plan?branch=master)

<img src="https://github.com/apradillap/redmine_equality_plan/blob/master/assets/images/equality.png" width="400" height="auto">

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
