Rails.application.routes.draw do

  namespace :admin do
    root to: 'layout#index'
    resources :articles, except: :show
    resources :courses, except: :show
    resources :tournaments
    resources :tutorials
  end

  resources :articles, only: [:index, :show]
  resources :courses, only: [:index, :show]
  resources :tournaments, only: :index
  resources :tutorials do
    member { post :vote }
  end

  root to: 'articles#index'
  get '/watch-twitch' => 'tournaments#watch'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout
end
