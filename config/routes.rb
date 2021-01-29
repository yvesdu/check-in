Rails.application.routes.draw do
  resources :standups
  devise_for :users, controllers: { registrations: "registrations"}
  resource :accounts

  get 'user/me', to: 'users#me', as: 'my_settings'
  patch 'users/update_me', to: 'users#update_me', as: 'update_my_settings'
  get 'user/password', to: 'users#password', as: 'my_password'
  patch 'user/update_password', to: 'users#update_password', as: 'my_update_password'

  scope 'account', as: 'account' do
    resources :users
  end
  
  get 'activity/mine'

  get 'activity/feed'

  get 'dates/:date', to: 'dates#update', as: 'update_date'

  root to: 'activity#mine'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end