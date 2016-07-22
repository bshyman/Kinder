Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  resources :users, only: [:new, :create]
  resources :kinders, only:[:index, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/404' => 'sessions#forbidden', as: "no_access"
  get '/kinders/:id/reject/:id' => 'kinders#reject', as: "swipe_left"
  get '/kinders/:id/accept/:id' => 'kinders#accept', as: "swipe_right"
end
