Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'


  get '/kinders/reset' => 'kinders#reset_kinders', as:"reset_kinders"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/404' => 'sessions#forbidden', as: "no_access"
  get '/kinders/:id/reject_user' => 'kinders#reject_user', as: "swipe_left"
  get '/kinders/:id/accept_user' => 'kinders#accept_user', as: "swipe_right"

  resources :users, except: [:index] do
    resources :playdates
    resources :children
  end

  resources :kinders, only:[:index, :show]

end


