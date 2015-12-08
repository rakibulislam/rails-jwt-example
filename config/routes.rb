Rails.application.routes.draw do

    post 'authenticate' => 'auth#authenticate'
    post 'reset-password' => 'auth#reset_password'

    namespace :api do
      namespace :v1 do
        resources :badges
        resources :users
      end
    end
end
