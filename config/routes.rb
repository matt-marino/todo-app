# typed: false
# frozen_string_literal: true

Rails.application.routes.draw do
  get "signup" => "users#new"
  resources :users
  root "tasks#index"
  resources :tasks do
    resources :task_ratings
  end
end
