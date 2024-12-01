Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :administrator do
    resources :tags
    resources :categories
  end

  namespace :me do
    resources :tasks
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # only: [:index, :show]
  # except: [:new]
  resources :homes, only: [:index]
  #namespace :api, defaults: {format: :json} do
  #  namespace :v2 do
  #    resources :posts, only: [:index]
  #  end

  #  namespace :v2 do
  #    resources :posts, only: [:index]
  #  end
  #end

  # Defines the root path route ("/")
  root "homes#index"
end
