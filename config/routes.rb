Rails.application.routes.draw do

  root 'events#index'

  resources :events, only: %i[show]

  namespace :conversation do
    resources :topics, only: %[show] do
      resource :messages, only: %[create], as: :conversation_messages
    end
  end

  devise_for :users
  ActiveAdmin.routes(self)
end
