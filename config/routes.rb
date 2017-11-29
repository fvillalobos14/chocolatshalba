Rails.application.routes.draw do

  get 'export_batches/join'

  get 'export_batches/new'
  
  get 'reports/index'

  get 'purchases/index'

  get 'purchases/new'

  post 'export_batches', to: 'export_batches#create'
  
  get 'static_pages/stages'

  get 'batches/moveBatches', to: 'batches#moveBatches'

  resources :sensory_analyses
  resources :quality_controls
  resources :revisions
  resources :entry_controls
  resources :batches
  resources :invoices
  resources :checkings
  resources :certificate_checks
  resources :purchases
  resources :reports
  resources :static_pages

  resources :entry_controls do
    resources :batches
    resources :reports
  end

  resources :batches do
    resources :quality_controls
    resources :certificate_checks
    resources :checkings
    resources :purchases
    resources :sensory_analyses
    resources :reports
  end

  resources :quality_controls do
    resources :revisions
  end

  resources :organizations do
    resources :entry_controls
  end

  resources :entry_controls do
    resources :documents
  end

  resources :reports do
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
