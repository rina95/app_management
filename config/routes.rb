Rails.application.routes.draw do
  root to: 'plans#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', }

  resources :plans
end
