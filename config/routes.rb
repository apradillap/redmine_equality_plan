# frozen_string_literal: true

# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match 'equality_plans', to: 'equality_plans#index', as: 'equality_plans', via: [:get]
match 'equality_plans_manage', to: 'equality_plans#manage', as: 'equality_plans_manage', via: [:get]
