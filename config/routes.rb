Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trainings, only: [:index, :show, :create, :update] do
        resources :bookings, only: [:index, :create]
      end
      resources :bookings, only: [:show, :update] do
         resources :reviews, only: [:index, :create]
      end
      resources :users, only: [:show, :create, :update]
    end
  end
end
