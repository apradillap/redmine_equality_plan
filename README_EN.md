[![Build Status](https://travis-ci.org/apradillap/redmine_equality_plan.svg?branch=master)](https://travis-ci.org/apradillap/redmine_equality_plan)
<a href="https://codeclimate.com/github/apradillap/redmine_equality_plan/maintainability"><img src="https://api.codeclimate.com/v1/badges/75bc2ecffcb7e3b4cc91/maintainability" /></a>
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)
[![Help wanted](https://img.shields.io/badge/help-wanted-brightgreen.svg?style=flat-square)](https://github.com/apradillap/redmine_equality_plan/issues?q=is%3Aissue+is%3Aopen+label%3A"help+wanted")


<img src="https://github.com/apradillap/redmine_equality_plan/blob/master/assets/images/equality.png" width="400" height="auto">
<a href='https://www.freepik.es/vectores/diseno'>Vector de Diseño creado por freepik - www.freepik.es</a>


# Redmine Plan de Igualdad

_Este README está disponible en español [en Español](README.md)_

With this plugin for Redmine, we want to put the first stone to promote
equality in the companies that use this project management software.

And not only gender equality can be visualized with this plugin, you can also
use to make visible inequalities of ethnicity, language, religion or color.


## What it offers
 * Visualization of the total number of men and women in the organization
 * Statistical indicators by groups within the company.
 * Indicators by gender of training, leave or type of contract.
 * ... and more to come. Do you have something on your mind? Let's talk!

<img src="https://github.com/apradillap/redmine_equality_plan/blob/master/assets/images/gender_chart.png" width="400" height="auto">

<img src="https://github.com/apradillap/redmine_equality_plan/blob/master/assets/images/age_chart.png" width="400" height="auto">


## Installation
1. Generate the configuration file:
  ```
  cp config/configuration.yml.example config/configuration.yml
  ```
2. Generate the user patch:
  ```
  cp lib/redmine_equality_plan/redmine_patch/user_custom_patch.rb.example lib/redmine_equality_plan/redmine_patch/user_custom_patch.rb
  ```
3. Execute the migrations:
  ```
  rake redmine:plugins:migrate
  ```
4. Define custom values config/configuration.yml and custom methods (see example files)

5. Execute tasks:
  ```
  rake gender:populate_user_gender
  rake gender:populate_gender_stories
  ```
6. Access from the menu to Equality Plan (/equality_plans)


## Compatibility

* Redmine 4.1.1 (2020-04-06)
* Easy Redmine from version 7.06 to 10.3.1 (2020-06-24)
* PostgreSQL

It will probably be compatible with previous versions of Redmine. If you try, let us know.


## Libraries/gems that are used:

* Gems: See [Gemfile](https://github.com/apradillap/redmine_equality_plan/blob/master/Gemfile) for a complete reference
* Others (CSS, JS): #ToDo (browse the source in the meantime ;)


## Tests
```
rake test TEST=plugins/redmine_equality_plan/test
```

## Who uses it
These are some of the organizations that use this equality plugin:
* [Open Sistemas](https://opensistemas.com/)


## Integration with Travis
https://github.com/alexbevi/redmine_plugins_travis-ci


## Appendix under the GNU AGPL license

This repository is free software: you can redistribute it and/or modify it under the terms
of the GNU Affero General Public License version 3 and later, published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty that it is **marketable** or **valid for a particular purpose**. For more details read the [GNU Affero General Public License](/LICENSE).

With this program you receive a copy of the license, but you can read it at [`https://www.gnu.org/licenses/`](https://www.gnu.org/licenses/).
