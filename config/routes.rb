Rails.application.routes.draw do
  get 'users/show'

  mount Ckeditor::Engine => '/ckeditor'
  root "static_pages#index"
  delete "join_event" => "user_events#destroy"

  devise_for :users, controllers: {registrations: "registrations", sessions: "authentications"}
  devise_for :admin, controllers: {sessions: "admin/sessions"}

  devise_scope :admin do
    get "/admin/sign_in" => "admin/sessions#new", as: :new_admin_sessions
    delete "/admin/sign_out" => "admin/sessions#destroy", as: :destroy_admin_sessions
  end

  namespace :admin do
    get "/" => "static_pages#index"
    resources :users
    resources :organizations, except: [:edit, :update, :destroy]
    resources :organization_requests
  end

  namespace :manager do
    get "/" => "static_pages#index"
    resources :requests
    resources :members
    resources :clubs
  end

  namespace :club_manager do
    get "/" => "static_pages#index"
    resources :clubs do
      resources :members, only: [:index, :show]
      resources :events do
        resources :news
      end
      resources :albums do
        resources :images
      end
      resources :user_clubs
    end
  end

  resources :users do
    resources :club_requests, only: [:new, :create, :index, :destroy]
    resources :organization_requests, only: [:new, :create, :index, :destroy]
    resources :clubs, only: :index
    resources :other_clubs, only: :index
  end

  resources :clubs, only: :show do
    resources :events, only: :show
  end

  resources :user_events, only: :create
  resources :ratings, only: :create
  resources :organizations, only: :show
  resources :time_line_homes
  resources :comments
  resources :users, only: :show
end
