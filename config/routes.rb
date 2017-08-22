Rails.application.routes.draw do

  resources :collection_centers
  resources :entry_controls

  resources :organizations do
    resources :collection_centers
    resources :entry_controls
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  get 'dashboard', to: 'static_pages#dashboard'


  devise_scope :user do
  	root to: "users/sessions#new"
  end
end
