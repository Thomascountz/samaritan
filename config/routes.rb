Rails.application.routes.draw do
  post 'time_zones/states_for_country'

  devise_for :users
  resources :projects
  resources :organizations, only: [:new, :create, :edit, :update]

  devise_scope :user do
    get 'sign_in',      to: 'devise/sessions#new'
    get 'sign_up',      to: 'devise/registrations#new'
    get 'sign_out',  to: 'devise/sessions#destroy'
  end

  root "projects#index"
end
