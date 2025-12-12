Rails.application.routes.draw do
resources :users, only: [:index] do
  post :impersonate, on: :member
  post :stop_impersonating, on: :collection
end

  patch 'change_password', to: 'users#update_password'
  get 'change_password', to: 'users#password'
  patch 'settings', to: 'users#update_settings'
  get 'settings', to: 'users#settings'
  devise_for :users
  get 'dash' => 'dashboards#home', as: :user_root 
  root to: 'landings#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
