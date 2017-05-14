Rails.application.routes.draw do

  devise_for :users

  resources :events do
    resources :comments
  end

  namespace :admin do
    root "events#index"
    resources :events
  end

  root "events#index"

end
