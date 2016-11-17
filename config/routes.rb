Rails.application.routes.draw do
  resources :posts
  resources :questions
  resources :advertisements
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
