Rails.application.routes.draw do

  devise_for :users

  root to: "site#home"

  get '/users/:user_id/json_stories', to: 'users#allStories', as: 'all_stories'


  resources :users do
    resources :context, :stories
  end

end
