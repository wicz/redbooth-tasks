# encoding: utf-8

Rails.application.routes.draw do
  root "home#index"
  resources :tasks, only: %w(index)
end

