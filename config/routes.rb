Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses
  resources :sections
  resources :terms

  post '/courses/import', to: 'courses#import'

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
