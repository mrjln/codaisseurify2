Rails.application.routes.draw do
  root to: 'pages#home'

  namespace :api do
    resources :artists do
      resources :songs
    end
  end

  resources :artists do
    resources :songs
  end

end
