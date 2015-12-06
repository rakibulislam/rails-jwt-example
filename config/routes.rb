Rails.application.routes.draw do

    namespace :api do
      namespace :v1 do
        resources :movements
        resources :users
      end
    end
end
