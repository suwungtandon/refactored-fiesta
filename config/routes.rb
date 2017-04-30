Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get controller: :index, action: :index

  resources :attendance_records, only: [ :edit, :create, :destroy ]

  root 'index#index'
end
