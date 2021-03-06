# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories, only: [:show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/auth/:provider/callback', to: 'omniauth_callbacks#login_with_twitter'
  resources :users, only: [:show]
  get 'users/setting/profile' => 'users#profile'
  post 'users/setting/profile' => 'users#edit_profile'
  root 'questions#index'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  post '/reply/:id/comment' => 'comments#create', as: 'comments'
  post '/replies/:id' => 'replies#select_best_answer', as: 'select_best_answer'
  delete '/replies/:id' => 'replies#delete_best_answer', as: 'delete_best_answer'

  resources :replies, only: [:create]

  resources :questions
end
