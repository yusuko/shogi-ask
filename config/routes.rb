# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/home' => 'static_pages#home'

  resources :questions
end
