Rails.application.routes.draw do

  devise_for :users
  root "static_pages#index"
  resources :event_requests
end
