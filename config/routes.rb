SportsOverload::Application.routes.draw do

  root :to => 'questions#index'

  resources :sessions, :only => [:new, :create, :destroy]
  resources :users, :only => [:show, :create, :new]

  resources :questions do
    resources :answers
  end

end
