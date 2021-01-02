Rails.application.routes.draw do
  resources :books
  root to: 'landing_page#index'
end
