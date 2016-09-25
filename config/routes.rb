Rails.application.routes.draw do
  root 'events#index'
  resources :events, only: %i[show]

  devise_for :users
  ActiveAdmin.routes(self)
end
