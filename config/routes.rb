Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'sessions#new'


  get '/kinders/reset' => 'kinders#reset_kinders', as:"reset_kinders"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/404' => 'sessions#forbidden', as: "no_access"
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/kinders/:id/reject_user' => 'kinders#reject_user', as: "swipe_left"
  get '/kinders/:id/accept_user' => 'kinders#accept_user', as: "swipe_right"

  resources :users, only: [:new, :create] do
    resources :playdates
    resources :children
  end
  mount ActionCable.server => '/cable'
  resources :chats, param: :id
  resources :messages
  resources :kinders, only:[:index, :show]

end
