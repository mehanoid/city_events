Rails.application.routes.draw do

  root 'events#index'

  resources :notifications, only: %i[show]
  resources :events, only: %i[show]
  resources :events_searches, except: %i[edit update]

  namespace :conversation do
    resources :topics, only: %[show] do
      resource :messages, only: %[create], as: :conversation_messages
    end
  end

  devise_for :users
  ActiveAdmin.routes(self)
end
