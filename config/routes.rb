Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  resources :providers do
    resources :trackings
  end

  namespace :api do
    namespace :v1 do
      resources :providers, only: [] do
        resources :trackings, only: %i(create)
      end
    end
  end

  root 'providers#index'
end
