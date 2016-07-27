Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#dashboard'

  get '/auth/:provider/callback', to: 'sessions#google_create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/404' => 'sessions#forbidden', as: "no_access"
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  post '/connections/search' => 'connections#search', as: "search"
  get '/users/:user_id/dashboard' => 'users#dashboard', as: "dashboard"
  get '/users/:user_id/playdates/:playdate_id/attendees/decline' => 'attendees#decline_invite', as: "decline_invite"
  get '/users/:user_id/playdates/:playdate_id/attendees/accept' => 'attendees#accept_invite', as: "accept_invite"
  get '/users/:id/add' => 'connections#direct', as: "direct_add"
  get '/users/:id/accept' => 'connections#direct_accept', as: "direct_accept"
  get '/users/:id/decline' => 'connections#direct_decline', as: "direct_decline"
  get '/users/:id/disconnect' => 'connections#disconnect', as: "disconnect"
  resources :users, except: [:index] do
    resources :playdates, except: [:update, :edit] do
      resources :attendees, only: [:new, :create]
    end
    resources :children
    resources :connections, only:[:index]
    resources :chats, only: [:index, :show, :create]
  end
  mount ActionCable.server => '/cable'
  resources :messages, only:[:create]
  get '/kinders/:id/reject_user' => 'kinders#reject_user', as: "swipe_left"
  get '/kinders/:id/accept_user' => 'kinders#accept_user', as: "swipe_right"
  get '/kinders/reset' => 'kinders#reset_kinders', as:"reset_kinders"
  post '/kinders/:id' => 'kinders#filter', as: 'filter'
  delete '/kinders/:id' => 'kinders#delete_filter', as: 'delete_filters'
  resources :kinders, only:[:index, :show]

end
