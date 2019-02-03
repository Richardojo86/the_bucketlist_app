Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bucketlists do
    resources :items, except: :create
    post "/items", to: "items#create", as: :item_create
  end
  root to: 'bucketlists#index'
end
