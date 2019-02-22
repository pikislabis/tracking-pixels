Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  resources :providers do
    resources :trackings
  end

  get 'my_profile' => 'profile#edit', as: :my_profile
  patch 'my_profile' => 'profile#update', as: :update_my_profile
  patch 'my_profile/api_token' => 'profile#recreate_api_token', as: :recreate_api_token

  namespace :api do
    namespace :v1 do
      resources :providers, only: [] do
        resources :trackings, only: %i(create)
      end

      resources :trackings, only: [], param: :code do
        patch :convert, on: :member
      end
    end
  end

  root 'providers#index'
end
