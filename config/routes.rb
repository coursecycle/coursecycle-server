Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :courses
  # resources :instructors
  # resources :sections
  # resources :terms

  get '/courses', to: 'courses#index'
  get '/courses/:id', to: 'courses#show'

  get '/instructors', to: 'instructors#index'
  get '/instructors/:id', to: 'instructors#show'

  get '/sections', to: 'sections#index'
  get '/sections/:id', to: 'sections#show'

  get '/terms', to: 'terms#index'
  get '/terms/:id', to: 'terms#show'

  # post '/courses/import', to: 'courses#import'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
