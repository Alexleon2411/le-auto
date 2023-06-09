Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars do
    resources :bookings, only: [:new, :show, :create, :destroy, :edit] do
      member do
        patch :accept
        patch :decline
      end
    end
  end
  get "dashboard", to: "pages#dashboard"
end
