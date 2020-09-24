[![Build Status](https://travis-ci.org/apradillap/redmine_equality_plan.svg?branch=master)](https://travis-ci.org/apradillap/redmine_equality_plan)
<a href="https://codeclimate.com/github/apradillap/redmine_equality_plan/maintainability"><img src="https://api.codeclimate.com/v1/badges/75bc2ecffcb7e3b4cc91/maintainability" /></a>
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)
[![Help wanted](https://img.shields.io/badge/help-wanted-brightgreen.svg?style=flat-square)](https://github.com/apradillap/redmine_equality_plan/issues?q=is%3Aissue+is%3Aopen+label%3A"help+wanted")

<img src="https://github.com/apradillap/redmine_equality_plan/blob/master/assets/images/equality.png" width="400" height="auto">
<a href='https://www.freepik.es/vectores/diseno'>Vector de Diseño creado por freepik - www.freepik.es</a>

# Redmine Plan de Igualdad

_This README is available [in English](README_EN.md)_

Con este plugin para Redmine, queremos poner la primera piedra para fomentar la
igualdad en las empresas que utilizan este software de gestión de proyectos.

Y no solo la igualdad de género se puede visualizar con este plugin, también se podrá
utilizar para visibilizar desigualdades de etnia, idioma, religión o color.


## Qué ofrece
 * Visualización del total de hombres y mujeres de la organización.
 * Indicadores estadísticos por grupos dentro de la empresa.
 * Indicadores por género de formación, bajas o tipo de contrato.
 * ... y más que irán llegando. ¿Tienes algo en la cabeza? ¡Hablemos!

<img src="https://github.com/apradillap/redmine_equality_plan/blob/master/assets/images/gender_chart.png" width="400" height="auto">

<img src="https://github.com/apradillap/redmine_equality_plan/blob/master/assets/images/age_chart.png" width="400" height="auto">


## Instalación
1. Generar el fichero de configuración:
  ```
  cp config/configuration.yml.example config/configuration.yml
  ```
2. Generar el parche para usuario:
  ```
  cp lib/redmine_equality_plan/redmine_patch/user_custom_patch.rb.example lib/redmine_equality_plan/redmine_patch/user_custom_patch.rb
  ```
3. Ejecutar las migraciones:
  ```
  rake redmine:plugins:migrate
  ```
4. Definir valores personalizados config/configuration.yml y métodos personalizados (ver archivos de ejemplo)

5. Ejecutar tareas:
  ```
  rake gender:populate_user_gender
  rake gender:populate_gender_stories
  rake gender:populate_gender_dismissals
  ```
6. Acceder desde el menú a Plan de Igualdad (/equality_plans)


## Compatibilidad

* Redmine 4.1.1 (2020-04-06)
* Easy Redmine desde la versión 7.06 a la 10.3.1 (2020-06-24)
* PostgreSQL

Probablemente será compatible con las versiones anteriores de Redmine. Si lo intentas, haznoslo saber.


## Liberías/gemas que se utilizan:

* Gemas: Ver [Gemfile](https://github.com/apradillap/redmine_equality_plan/blob/master/Gemfile) para una referencia completa
* Otros (CSS, JS): #ToDo (navegar por la fuente mientras tanto ;)


## Tests
```
rake test TEST=plugins/redmine_equality_plan/test
```

## Quién lo usa
Estas son algunas de las organizaciones que usan este plugin de igualdad:
* [Open Sistemas](https://opensistemas.com/)


## Integración con Travis
https://github.com/alexbevi/redmine_plugins_travis-ci


## Apéndice conforme la licencia GNU AGPL

Este repositorio es software libre: puedes redistribuirlo y/o modificarlo bajo los términos
de la GNU Affero General Public License versión 3 y posteriores, publicada por la Free Software Foundation.

Este programa se distribuye con la esperanza de ser útil, pero **sin garantía alguna**; incluso sin la garantía implícita de que pueda ser **comercializable** o **válido para un propósito concreto**. Para más detalles lee la [licencia GNU Affero General Public License](/LICENSE).

Con este programa recibes una copia de dicha licencia, pero en todo caso puedes leerla en [`https://www.gnu.org/licenses/`](https://www.gnu.org/licenses/).

<a href="https://www.buymeacoffee.com/carlosmanza" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
<a href="https://www.buymeacoffee.com/apradillap" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
