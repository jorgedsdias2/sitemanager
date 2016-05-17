# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  resources :sessions

  get 'login', to: 'sessions#new'
end