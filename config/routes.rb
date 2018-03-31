Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end

  get '/coverage', to: redirect('/coverage/index.html')

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
