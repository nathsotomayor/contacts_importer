Rails.application.routes.draw do
  devise_for :users
  resources :contacts do
    collection {post :import}
  end
  root to: "home#index"
end
