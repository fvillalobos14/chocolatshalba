Rails.application.routes.draw do
  get 'batches/moveBatches', to: 'batches#moveBatches'

  resources :quality_controls
  resources :revisions
  resources :entry_controls
  resources :batches

  resources :entry_controls do
    resources :batches
  end

  resources :batches do
    resources :quality_controls
  end

  resources :quality_controls do
    resources :revisions
  end

  resources :organizations do
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
