Rails.application.routes.draw do
  root to: 'images#index'

  resources :images
  
  get 'bulk_images', to: 'bulk_images#index'
  post 'bulk_images', to: 'bulk_images#create'
end
