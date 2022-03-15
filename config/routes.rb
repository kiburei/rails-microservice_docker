Rails.application.routes.draw do
  get 'fx_transactions/index'
  post 'fx_transactions/create'
  get 'fx_transactions/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
