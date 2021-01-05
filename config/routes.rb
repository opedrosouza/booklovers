Rails.application.routes.draw do
  devise_for :admins, 
    path: 'auth', 
    path_names: { 
      sign_in: 'login', 
      sign_out: 'logout', 
      password: 'secret', 
      confirmation: 'verification', 
      unlock: 'unblock', 
      registration: 'register', 
      sign_up: 'cmon_let_me_in' 
    },
    controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      passwords: 'admins/passwords'
    }

  resources :books
  root to: 'books#index'
  get '/landing', to: 'landing_page#index'
end
