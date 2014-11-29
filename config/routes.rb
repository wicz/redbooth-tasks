# encoding: utf-8

Rails.application.routes.draw do
  resources :tasks, only: %w(index)
  get "/auth/:provider/callback", to: "sessions#create"

  root "home#index"
end

