Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :contacts do
    collection {post :import}
  end
end
