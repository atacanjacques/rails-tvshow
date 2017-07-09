Rails.application.routes.draw do
  devise_for :users
  resources :channels
  resources :genres
  resources :users_extend, :path => 'users', param: :username, only: [:index, :show]
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

  root 'tv_shows#index'
end
