Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:show]
  resources :resolutions
  resources :events
end
