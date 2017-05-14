Rails.application.routes.draw do

  devise_for :users

  resources :users

  resources :events do
    resources :comments do
      member do
        get :highlight
      end
    end
  end

  namespace :admin do
    root "events#index"
    resources :events
  end

  root "events#index"

end
