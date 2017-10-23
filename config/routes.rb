Rails.application.routes.draw do

  devise_for :users, path: 'u'

  root to: "site#home", as: 'home'

  get '/children/:child_id/json_stories', to: 'children#allStories', as: 'all_stories'
  post '/tellers/add_teller', to: 'tellers#addTeller', as: 'add_teller'


  resources :users do
    resources :children do
      resources :stories
    end
  end

end
