Rails.application.routes.draw do
  
  get 'welcome/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :uploads

root 'welcome#index'

devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations",:omniauth_callbacks => "users/omniauth_callbacks" }

resources :users, only: [:show] 
resources :posts do 
	resources :comments
	resources :reviews
end
resources :tests
resources :questions
resources :testquestions

post 'welcome/contact_us_mailer' 
# match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
# match 'auth/failure', to: redirect('/'), via: [:get, :post]
# match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
