Rails.application.routes.draw do
  # The landing page
  root 'welcome#index'
  # Opportunities endpoints
  resources :opportunities
  # Our Mission page
  resources :contacts, only: [:new, :create]
  get 'contacts/new'
  # Admin dashboard; only accessible for users with superadmin_role
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Devise routes
  devise_for :users
  # Donate button with stripe
  resources :charges
  # Search route
  resources :search, only: [:index]
end
