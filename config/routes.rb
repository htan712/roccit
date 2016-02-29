Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :post, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'

  get 'about' => 'welcome#about'

end
