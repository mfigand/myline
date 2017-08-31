Rails.application.routes.draw do

  devise_for :users

  root to: "site#home", as: 'home'

  get '/users/:user_id/json_stories', to: 'users#allStories', as: 'all_stories'


  resources :users do
    resources :contexts, :stories
  end

end
