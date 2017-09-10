Rails.application.routes.draw do

  devise_for :users

  resources :users

  resources :events do
    resources :comments do
      member do
        post :highlight
      end
    end
  end

  resource :cart do
    collection do
      post :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    root "events#index"
    resources :events
  end

  root "events#index"

end
