Rails.application.routes.draw do

  root "products#index"

  resources :line_items, only: [:index, :new, :create, :update, :destroy]
  resources :carts, :path => "mon_panier"
  resources :products, :path => "chat"
  resources :orders, only: [:index, :new, :show, :create], :path => "ma_commande"
  resource  :charges

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'user/:id' => 'users#show', as: :user
  end

end
