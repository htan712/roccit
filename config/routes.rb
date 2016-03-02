Rails.application.routes.draw do
  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :post, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    get '/up-vote' => 'votes#up_vote', as: :up_vote
    get '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'

  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'

  get 'about' => 'welcome#about'
end
