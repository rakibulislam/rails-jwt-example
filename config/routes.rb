Rails.application.routes.draw do

    post 'authenticate' => 'auth#authenticate'

    namespace :api do
      namespace :v1 do
        resources :movements
        resources :users
      end
    end
end
