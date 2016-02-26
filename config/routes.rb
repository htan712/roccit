Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  root 'welcome#index'

  get 'about' => 'welcome#about'

end
