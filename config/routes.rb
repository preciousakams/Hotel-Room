Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :rooms
      resources :users do
        resources :reservations
      end
    end
  end
  root 'api/v1/rooms#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
