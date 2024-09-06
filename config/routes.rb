Rails.application.routes.draw do
  root to: 'plans#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', }

  resources :plans do
    collection { post :import }
  end
  resources :softwares do
    collection { post :import }
  end
  resources :libraries
  resources :users
  resources :apps
  resources :meetings
  resources :book_meetings
end
