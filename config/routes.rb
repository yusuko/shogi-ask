# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]
  get 'users/setting/profile' => 'users#profile'
  post 'users/setting/profile' => 'users#edit_profile'
  root 'questions#index'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  post '/comments/:id' => 'comments#create', as: 'comments'
  post '/replies/:id' => 'replies#select_best_answer', as: 'select_best_answer'
  delete '/replies/:id' => 'replies#delete_best_answer', as: 'delete_best_answer'

  resources :replies, only: [:create]

  resources :questions
end
