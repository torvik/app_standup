Rails.application.routes.draw do
  resources :standups
  devise_for :users, controllers: { registrations: "registrations" }  
  resource :accounts
  resources :teams, path: 't'

  get 'user/me', to: 'users#me', as: 'my_settings'
  patch 'users/update_me', to: 'users#update_me', as: 'update_my_settings'
  get 'user/password', to: 'users#password', as: 'my_password'
  patch 'user/update_password',to:'users#update_password',as:'my_update_password'

  scope 'account', as: 'account' do
    resources :users
  end

  get 's/new/(:date)', to: 'standups#new', as: 'new_standup'
  get 's/edit/(:date)', to: 'standups#edit', as: 'edit_standup'
  resources :standups, path: 's', except: [:new, :edit]

  get 'activity/mine'
  get 'activity/feed'


  root to: 'activity#mine'

  get 'dates/:date', to: 'dates#update',as: 'update_date'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
