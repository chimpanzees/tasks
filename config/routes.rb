Tasks::Application.routes.draw do

  resources :tasks do
    put :complete, :on => :member
  end
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  root :to => 'tasks#index'
end
