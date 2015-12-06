Rails.application.routes.draw do

    scope module: 'api/v1' do
       resources :movements, only: [:index, :show]
       resources :users, only: [:index, :show]
     end
end
