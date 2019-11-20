Rails.application.routes.draw do
  get 'home/index'
  resources :lists do
    resources :cards
    member do
      get 'reorder'
    end
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
