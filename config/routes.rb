Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  
  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/news', to:'static_pages#news'
  get '/auto_load', to:'static_pages#auto_load'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/easy_login', to: 'sessions#easy_login'
  delete 'logout', to: 'sessions#destroy' 
  get '/search', to: 'search#index'
  get '/search/auto_load_tips', to: 'search#auto_load_tips'
  get '/search/auto_load_users', to: 'search#auto_load_users'
 
  resources :users ,only:[:new,:create,:destroy,:update,:show,:edit,:index] do
    member do
        get :following, :followers, :password
    end
    collection do
        get :auto_load, :auto_load_followers, :auto_load_followings
    end
    resources :tips ,only:[:new,:create,:destroy,:update,:show,:edit] do
        get :refer
        collection do
            get :auto_load
        end
    end
    resources :shelves
    resources :user_detail
  end
  
  resources :account_activations ,only: [:edit] do
    collection do
        get :tutorial
    end
  end
  resources :password_resets, only:[:new,:create,:edit,:update]
  resources :relationships,       only: [:create, :destroy]
  resources :likes,       only: [:create, :destroy]
end
