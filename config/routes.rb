Rails.application.routes.draw do
  
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/:provider', :to => 'sessions#create', as: :create_session

  get '/sessions/index', :to => 'sessions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
