Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index' 
  resources :articles 
  get 'about' => 'welcome#about'
  get 'signup' => 'users#new'
  resources :users, except: [:new]
  get 'login' =>  'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'session#destroy'
end
