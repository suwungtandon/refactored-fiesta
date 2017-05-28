Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get controller: :index, action: :index

  resources :attendance_records, only: [ :edit, :create, :destroy, :update ]

  post '/attendance_records/new', to: 'attendance_records#new'

  get '/attendance_records/download', to: 'attendance_records#download'

  root 'index#index'
end
