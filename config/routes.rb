Rails.application.routes.draw do
  devise_for :users
  resources :channels
  resources :episodes do
    get 'add_user_episode', :on => :member
    get 'remove_user_episode', :on => :member
    get 'my_episodes', :on => :collection
  end
  resources :tv_shows do
    get 'add_user_tv_show', :on => :member
    get 'remove_user_tv_show', :on => :member
    get 'my_tv_shows', :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tv_shows#index'
  resources :genres
end
