Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#dashboard'

  get '/kinders/reset' => 'kinders#reset_kinders', as:"reset_kinders"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/404' => 'sessions#forbidden', as: "no_access"
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/kinders/:id/reject_user' => 'kinders#reject_user', as: "swipe_left"
  get '/kinders/:id/accept_user' => 'kinders#accept_user', as: "swipe_right"
  get '/users/:user_id/playdates/:playdate_id/attendees/decline' => 'attendees#decline_invite', as: "decline_invite"
   get '/users/:user_id/playdates/:playdate_id/attendees/accept' => 'attendees#accept_invite', as: "accept_invite"
  get '/users/:user_id/dashboard' => 'users#dashboard', as: "dashboard"

  resources :users, except: [:index] do
    resources :playdates do
      resources :attendees, only: [:new, :create]
    end
    resources :children
  end

  resources :kinders, only:[:index, :show]

end
