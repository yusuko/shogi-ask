# frozen_string_literal: true

Rails.application.routes.draw do
  root 'questions#index'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'

  resources :questions
end
