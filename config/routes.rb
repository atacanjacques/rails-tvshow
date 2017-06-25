Rails.application.routes.draw do
  devise_for :users
  resources :channels
  resources :episodes
  resources :tv_shows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tv_shows#index'
  resources :genres
end