Rails.application.routes.draw do

  get 'welcome' => 'page#welcome'
  root 'page#welcome'
  get 'signup'  => 'users#new'


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :microposts
end
