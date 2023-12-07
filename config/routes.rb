Rails.application.routes.draw do
  devise_for :users, path: '',  path_names: {
                                  sign_in: 'login',
                                  sign_out: 'logout',
                                  registration: 'signup'
                                },
                                controllers: {
                                  sessions: 'users/sessions',
                                  registrations: 'users/registrations'
                                }
  resources :teams do
    resources :users do
      post :new_users, on: :collection
    end
    collection do
      post :signup
    end
  end

  resources :users, only: [:index]
  

  namespace :api do
    namespace :v1 do
      get :authenticate, controller: :users, action: :authenticate
      resources :teams
    end
  end
end
