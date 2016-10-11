Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#about"

  get "/signup", to: "registrations#new"
  post "/signup", to: "registrations#create"

  get "login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "users/:id", to: "users#show", as: "profile"


  resources :chatrooms, param: :slug
  resources :messages, only: :create


  #Step 1 in Establishing the WebSocket Connection (server side): mount the Action Cable server on a sub-URI of our main application:
  #Serve websocket cable requests in-process
  mount ActionCable.server => "/cable"
  #When our main app is instantiated, an instance of Action Cable will also be created. Action Cable will establish a websocket connection on ws://localhost:3000/cable, and begin listening for socket requests on that URI (using Rack socket hijacking API).
  #Step 2 is establishing the socket connection client side, which we do via Javascript

end
