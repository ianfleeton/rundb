# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :events, only: [:index]
  end

  resources :events, only: %i[index new create]
end
