Rails.application.routes.draw do

  post 'transactions' => 'fx_transactions#create'
  get 'transactions' => 'fx_transactions#index'
  get 'transactions/:id' => 'fx_transactions#show'
  patch 'transactions/:id' => 'fx_transactions#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
