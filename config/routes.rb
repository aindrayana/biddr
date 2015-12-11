Rails.application.routes.draw do

  root "auctions#index"
  resources :users, only: [:new, :create]
  resources :auctions, only: [:index, :new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection  #on: :collection make the delete not require an id
  end

end
