Rails.application.routes.draw do

  devise_for :users, path: 'u'

  root to: "site#home", as: 'home'

  post '/users/:user_id/children/:child_id/stories', to: 'stories#create', as: 'user_user_stories'
  # get '/users/:user_id/tellers', to: 'tellers#index', as: 'user_child'
  # get '/users/:user_id/stories', to: 'stories#index', as: 'user_child'

  get '/children/:child_id/json_stories', to: 'children#allStories', as: 'all_stories'
  post '/users/add_teller', to: 'tellers#create', as: 'add_teller'


  resources :users do
    resources :children do
      resources :stories
    end
  end

  # resources :parents do
  #   resources :children do
  #     resources :stories
  #   end
  # end

end
