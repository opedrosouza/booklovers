Rails.application.routes.draw do
  devise_for :admins, 
    path: 'admin', 
    path_names: { 
      sign_in: 'entrar', 
      sign_out: 'sair', 
      password: 'senha',
      registration: 'cadastro', 
      sign_up: 'cadastrar' 
    },
    controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      passwords: 'admins/passwords'
    }
  devise_for :users, 
    path: '/', 
    path_names: { 
      sign_in: 'entrar', 
      sign_out: 'sair', 
      password: 'senha',
      registration: 'cadastro', 
      sign_up: 'cadastrar' 
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }

  resources :books
  resources :comments, only: %i[create destroy]

  root to: 'books#index'

  get '/landing', to: 'landing_page#index'
end
