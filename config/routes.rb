Rails.application.routes.draw do
  root to: 'pages#home'

  #Nested routes
  resources :artists do
    resources :songs
  end

  resources :songs
end
