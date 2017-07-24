Rails.application.routes.draw do

  devise_for :users

  root to: "site#home"

  resources :users do
    resources :context, :stories
  end

end
