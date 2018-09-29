Rails.application.routes.draw do
  get 'comments/new'
  resources :likes
  get "auth/:provider/callback" => "sessions#create"
  get "auth/failure", to: redirect('/')
  root 'static_pages#home'
  get '/post',    to: 'posts#index'
  get  '/help',    to: 'static_pages#help'
  get '/users',     to: 'users#index'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :friendships
  resources :posts,          only: [:create, :destroy]
 resources :posts do
  resources :likes
  resources :comments
 end

 resources :comments do
  resources :comments
 end
 resources :account_activations, only: [:edit]
end
