Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root 'posts#index'

devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

resources :users, only: [:show] 
resources :posts

end
