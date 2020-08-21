Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/auto_load', to:'static_pages#auto_load'
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' 
  resources :users ,only:[:new,:create,:destroy,:update,:show,:edit,:index] do
    member do
        get :following, :followers
    end
    collection do
        get :auto_load
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
  
  resources :account_activations,only: [:edit]
  resources :password_resets, only:[:new,:create,:edit,:update]
  resources :relationships,       only: [:create, :destroy]
  resources :likes,       only: [:create, :destroy]
end
