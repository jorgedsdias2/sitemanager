# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
	resources :users
	resources :pages
	resources :sessions
	
	get 'index', to: 'sessions#index'
	get 'panel', to: 'sessions#new'
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	get 'logout', to: 'sessions#destroy'
	get 'dashboard', to: 'sessions#index'	
end