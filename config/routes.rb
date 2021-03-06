Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
      }
  root "organizations#index"
  resources :organizations do
    resources :pics
  end
  get "/search", to: 'search#index'

end
