Rails.application.routes.draw do
  resources :topics do
      resources :posts, except: [:index]
      resources :sponsored_posts
  end

  resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
     resources :favorites, only: [:create, :destroy]
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show, :confirm]
  resources :sessions, only: [:new, :create, :destroy]
  post 'users/confirm' => 'users#confirm'
  get 'about' => 'welcome#about'
  get 'welcome/FAQ' => 'welcome#FAQ'
  root 'welcome#index'
end
