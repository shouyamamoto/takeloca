Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :users do
    member do
      get :favorites
    end
    get :search, on: :collection
  end
  
  root to: "toppages#index"
  get 'about', to: "toppages#show"
  resources :toppages
  
  resources :articles 
  resources :favorites, only: [:create, :destroy]
end
