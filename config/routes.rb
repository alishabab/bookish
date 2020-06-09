Rails.application.routes.draw do
  devise_for :users, except: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    post '/downvote', to: 'votes#downvote'
    post '/upvote', to: 'votes#upvote'
  end
  resources :categories, only: [:index, :show]
  root to: 'articles#index'
end
