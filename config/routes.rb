# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home' => 'static_pages#home'

  resources :questions
end
