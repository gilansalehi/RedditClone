Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :subs, only: [:index, :new, :create, :show, :update, :edit, :destroy] do
    resources :posts, only: [:new]
  end

  resources :posts, only: [:create, :show, :update, :edit, :destroy]

  root to: "subs#index"
end
