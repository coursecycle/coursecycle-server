Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses
  resources :terms

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
