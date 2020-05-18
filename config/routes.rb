# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match 'gender_stories', to: 'gender_stories#index', as: 'gender_stories', via: [:get]
match 'gender_stories_manage', to: 'gender_stories#manage', as: 'gender_stories_manage', via: [:get]

