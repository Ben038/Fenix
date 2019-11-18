Rails.application.routes.draw do

devise_for :users

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages, only: [:index, :show, :home]

  # resources :users, only: [:new, :create, :destroy]
  resources :accounting_data, only: [:new, :create, :index, :destroy] do
    collection {post :import}
  end
  resources :file_uploads, only: [:index, :new, :create, :destroy]
  resources :international_clients, only: [:new, :create, :destroy]

end
