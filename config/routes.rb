Rails.application.routes.draw do
  root to: 'articles#index'

  namespace :admin do
    resources :articles
  end
  resources :articles, only: [:index, :show]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
end
