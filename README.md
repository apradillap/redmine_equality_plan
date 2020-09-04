[![Build Status](https://travis-ci.org/apradillap/redmine_equality_plan.svg?branch=master)](https://travis-ci.org/apradillap/redmine_equality_plan)
<a href="https://codeclimate.com/github/apradillap/redmine_equality_plan/maintainability"><img src="https://api.codeclimate.com/v1/badges/75bc2ecffcb7e3b4cc91/maintainability" /></a>

<img src="https://github.com/apradillap/redmine_equality_plan/blob/master/assets/images/equality.png" width="250" height="auto">

# Redmine Plan de Igualdad

_This README is available [in English](README_EN.md)_

Con este plugin para Redmine, queremos poner la primera piedra para fomentar la
igualdad en las empresas que utilizan este software de gestión de proyectos.

Y no solo la igualdad de género se puede visualizar con este plugin, también se podrá
utilizar para visibilizar desigualdades de etnia, idioma, religión o color.


## Instalación
1. Ejecutar las migraciones:
  ```
  rake redmine:plugins:migrate
  ```
2. Generar el fichero de configuración:
  ```
  cp config/configuration.yml.example config/configuration.yml
  ```
3. Define los ids de los campos personalizados que reflejarán distintas características
   del género del usuario en config/configuration.yml

4. Generar el parche para usuario:
```
cp lib/redmine_equality_plan/redmine_patch/user_custom_patch.rb.example lib/redmine_equality_plan/redmine_patch/user_custom_patch.rb
```

5. Definir valores personalizados y métodos personalizados (ver archivos de ejemplo)

6. Ejecutar tareas:
```
rake gender:populate_user_gender
rake gender:populate_gender_stories
```

6. Acceder a /gender_stories


## Compatibilidad

* Redmine 4.1.1 (2020-04-06)
* Easy Redmine desde la versión 7.06 a la 10.3.1 (2020-06-24)

Probablemente será compatible con las versiones anteriores de Redmine. Si lo intentas, haznoslo saber.


## Liberías/gemas que se utilizan:

* Gemas: Ver [Gemfile](https://github.com/apradillap/redmine_equality_plan/blob/master/Gemfile) para una referencia completa
* Otros (CSS, JS): #ToDo (navegar por la fuente mientras tanto ;)


## Tests
```
rake test TEST=plugins/redmine_equality_plan/test/unit/gender_story_test.rb
```

## Integración con Travis
https://github.com/alexbevi/redmine_plugins_travis-ci
