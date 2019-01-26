# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  namespace :api do
    resources :events, only: [:index]
  end

  resources :events, only: %i[index new create]

  root to: 'events#index'
end
