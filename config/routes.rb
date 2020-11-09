Rails.application.routes.draw do
  get 'contacts/new'
  get 'about_us/index'
  get 'opportunities/index'
  devise_for :users
  root 'welcome#index'
  resources :charges
  get '/about_us/index', to: 'about_us#index'
  resources :opportunities
  # get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :contacts, only: [:new, :create]
end
