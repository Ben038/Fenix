Rails.application.routes.draw do

devise_for :users
# as :user do
#   get 'signin', to: 'devise/sessions#new', as: :new_user_session
#   post 'signin', to: 'devise/sessions#create', as: :user_session
#   delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
# end

  root to: 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages, only: [:index, :show]

  # resources :users, only: [:new, :create, :destroy]
  resources :accounting_data, only: [:new, :create, :destroy]
  resources :file_uploads, only: [:index, :new, :create, :destroy]
  resources :international_clients, only: [:new, :create, :destroy]

end
