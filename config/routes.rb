Gists::Application.routes.draw do
  
  resource :session, only: [ :new, :create, :destroy ]
  
  resources :users do
    resources :gists, only: [ :index, :show ]
  end

  resources :gists
  
  root to: 'home#index'
  
end
