Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  root 'welcome#index'

  get 'about' => 'welcome#about'

end
