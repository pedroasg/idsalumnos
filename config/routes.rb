Rails.application.routes.draw do

  namespace :admin do
    root to: 'layout#index'
    get "layout/search" => 'layout#search', as: "layout_search"
    resources :articles, except: :show
    resources :courses, except: :show
  end

  resources :articles, only: [:index, :show]
  resources :courses, only: [:index, :show]

  root to: 'articles#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
end
