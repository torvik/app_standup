Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }  
  resource :accounts
  
  get 't/new', to: 'teams#new'
  get 't/:id/edit', to: 'teams#edit'
  get 't/:id/s', to: 'teams#standups', as: 'team_standups'
  get 't/:id/s/(:date)', to: 'teams#standups', as: 'team_standups_by_date'
  get 't/:id/(:date)', to: 'teams#show'
  resources :teams, path: 't'

  get 's/new/(:date)', to: 'standups#new', as: 'snew_standup'
  get 's/edit/(:date)', to: 'standups#edit', as: 'sedit_standup'
  resources :standups, path: 's', except: [:new, :edit]

  get 'user/me', to: 'users#me', as: 'my_settings'
  patch 'users/update_me', to: 'users#update_me', as: 'update_my_settings'
  get 'user/password', to: 'users#password', as: 'my_password'
  patch 'user/update_password',to:'users#update_password',as:'my_update_password'

  scope 'account', as: 'account' do
      resources :users do
        member do
          get 's', to: 'users#standups', as: 'standups'
          get 's/(p/:page)', action: :standups
        end
      end
  end

  get 'activity/mine'
  get 'activity/mine/(p/:page)', to: 'activity#mine'

  get 'activity/feed'

  get 'dates/:date', to: 'dates#update',as: 'update_date'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'activity#mine'
end
