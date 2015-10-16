Rails.application.routes.draw do
  root to: 'visitors#index'

  namespace :admin do
    resources :articles
  end
  resources :articles, only: :index
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
end
