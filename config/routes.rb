Rails.application.routes.draw do
  devise_for :credentials
  #devise_for :users, controllers: { sessions: 'devise/sessions' }
  #devise_for :users, controllers: { sessions: "users/sessions" }
  resources :klasses
  resources :schools
  resources :users#, :only => [:show]
  resources :pages


  root 			to: 'pages#main'

  #match '/schools/add_klass/:id' => 'schools#add_klass', via: :get, as: :add_klass

  #resources :schools do
  #  post :add_klass, :on => :member
  #end

  #unauthenticated do
  #  root :to => 'sessions#new'
  #end

  #authenticated do
  #  root :to => 'pages#main'
  #end
  #get			  'sessions/new'

  #get	 'login'	=> 'sessions#new'
  #post	 'login'	=> 'sessions#create'
  #delete 'logout'	=> 'sessions#destroy'

  #devise_scope :user do
    #get   'login' =>  'devise/sessions#new'
    #get   'logout'=>  'devise/sessions#destroy'
  #  unauthenticated do
    #  root :to => 'sessions#new'
  #  end

    #authenticated do
    #  root :to => 'pages#main'
    #end
  #end
end
