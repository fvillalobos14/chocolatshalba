Rails.application.routes.draw do

  get 'inventories/index'

  get 'export_batches/join'

  get 'export_batches/new'

  get 'reports/index'#
  get 'inventories/index'#

  get 'purchases/index'

  get 'purchases/new'

  post 'export_batches', to: 'export_batches#create'

  get 'static_pages/stages'

  get 'static_pages/traceability'

  get 'static_pages/quality_info'

  get 'batches/moveBatches', to: 'batches#moveBatches'

  put 'batches/:id(.:format)', to: 'batches#move_batch'

  get 'sequence', to: 'sequences#create'


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
  resources :inventories
  resources :static_pages
  resources :export_batches
  resources :documents
  resources :filechecklists
  resources :barcodes


  resources :sequences

  resources :entry_controls do
    resources :batches
    resources :reports
    resources :barcodes
    resources :inventories
  end

  resources :batches do
    resources :quality_controls
    resources :certificate_checks
    resources :checkings
    resources :purchases
    resources :sensory_analyses
    resources :reports
    resources :barcodes
  end

  resources :quality_controls do
    resources :revisions
  end

  resources :organizations do
    resources :entry_controls
  end

  resources :entry_controls do
    resources :documents, only: [:new, :create]
    resources :filechecklists, only: [:new, :create]
  end

  resources :invoices do
    resources :bills, only: [:new, :create]
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
