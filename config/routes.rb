Rails.application.routes.draw do
  root to: 'images#index'

  resources :images
  
  get 'bulk_images', to: 'bulk_images#index'

  get 'bulk_images/new', to: 'bulk_images#index'
  post 'bulk_images', to: 'bulk_images#create'
  delete 'bulk_images/destroy', to: 'bulk_images#destroy'
end
