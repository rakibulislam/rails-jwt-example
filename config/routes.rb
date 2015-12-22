Rails.application.routes.draw do

    post 'authenticate' => 'auth#authenticate'
    post 'reset-password' => 'auth#reset_password'

    namespace :api do
      namespace :v1 do
        resources :users
        patch 'users/:id/badges' => 'badges#update'
        get 'users/:id/badges' => 'badges#index'
      end
    end
end
