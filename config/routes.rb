Rails.application.routes.draw do
  devise_for :users, lexcept: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    post '/downvote', to: 'votes#downvote'
    post '/upvote', to: 'votes#upvote'
  end
  resources :categories, only: [:index, :show]
  get '/my_articles', to: 'articles#my_articles'
  root to: 'articles#index'
end
