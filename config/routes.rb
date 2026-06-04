Rails.application.routes.draw do
  root "articles#index"
  
  resources :categories, only: [:index, :show]
  
  resources :articles do
    resources :comments, only: [:create, :destroy]
    
    member do
      patch :publish
    end
  end
  
  get "search", to: "articles#search"
end