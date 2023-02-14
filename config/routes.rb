# typed: false
# frozen_string_literal: true

Rails.application.routes.draw do
  resources :groups
  get "signup" => "users#new"
  resources :users
  resource :session, only: [:new, :create, :destroy]
  root "tasks#index"
  resources :tasks do
    resources :task_ratings
    resources :favorites, only: [:create, :destroy]
  end
  get "tasks/filter/:filter" => "tasks#index", as: :filtered_tasks
end
