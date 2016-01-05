Rails.application.routes.draw do

    post 'authenticate' => 'auth#authenticate'
    post 'reset-password' => 'auth#reset_password'

    namespace :api do
      namespace :v1 do

        #USERS
        resources :users, only: [:index, :show, :create, :update, :destroy]

        #BADGES
        patch 'users/:id/badges' => 'badges#update'

        #BOX OWNERS
        post 'users/:user_id/boxes' => 'box_owners#create'
        patch 'users/:user_id/boxes/:id' => 'box_owners#update'
        delete 'users/:user_id/boxes/:id' => 'box_owners#destroy'
        get 'users/:user_id/boxes' => 'box_owners#index'
        get 'users/:user_id/boxes/:id' => 'box_owners#show'

        #BOXES
        get 'boxes' => 'boxes#index'
        get 'boxes/:id' => 'boxes#show'

        #KLASSES
        post 'users/:user_id/boxes/:box_id/klasses' => 'klasses#create'
      end
    end
end
