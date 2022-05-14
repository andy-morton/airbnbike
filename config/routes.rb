Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes, only: %i[index show]
  resources :user, only: :show
end
