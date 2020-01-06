Rails.application.routes.draw do

devise_for :users

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # page for the commissions-view
  get "commissions", to: "pages#commissions"
  # page for the commissions-view
  get "claims", to: "pages#claims"
  # integrating routes to notes
  get "notes", to: "pages#notes"
  post 'notes', to: "notes#index"

  # website landing page (home), dashboard (index) [and not yet active (show)]
  resources :pages, only: [:index, :show, :home] do
    collection do
      post 'share_page_with_options'
    end
  end

  # resources :users, only: [:new, :create, :destroy]
  resources :accounting_data, only: [:new, :create, :index, :destroy] do
    collection {post :import}
  end

  # file upload section
  resources :file_uploads, only: [:index, :new, :create, :destroy]

  #international client section
  resources :international_clients, only: [:new, :create, :destroy]

  # integrating routes to notes
  # resources :notes, only [:store, :new, :create, :destroy, :update]

  resources :contacts

end
