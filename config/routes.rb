Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  resources :providers do
    resources :trackings
  end

  root 'providers#index'
end
