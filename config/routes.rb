# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :users
  resources :groups
  resources :pages
  resources :sessions
  resources :pages_uploads
  post 'pages_uploads_destroy', to: 'pages_uploads#destroy'

  get 'index', to: 'sessions#index'
  get 'panel', to: 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'dashboard', to: 'sessions#index'
end
