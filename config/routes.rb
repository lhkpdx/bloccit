Rails.application.routes.draw do
  resources :topics do
      resources :posts, except: [:index]
      resources :sponsored_posts
  end
  resources :users, only: [:new, :create, :confirm]
  resources :sessions, only: [:new, :create, :destroy]
  post 'users/confirm' => 'users#confirm'
  get 'about' => 'welcome#about'
  get 'welcome/FAQ' => 'welcome#FAQ'
  root 'welcome#index'
end
