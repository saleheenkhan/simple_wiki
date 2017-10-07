Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :articles
  resources :user_admin do
    member do
      put 'disable'
    end
  end
  resources :categories, only: [:index, :show, :create]
  resources :tags, only: [:index, :show, :create]
  get :search, controller: :main
  root to: 'articles#index'
end
