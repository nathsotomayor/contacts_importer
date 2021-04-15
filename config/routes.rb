Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :contacts
  resources :invalid_contacts, only: [:index]
  resources :imported_files do
    collection {post :import}
  end
end
