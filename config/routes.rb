Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  devise_for :users, controllers: { registrations: "registrations" }
  
  resource :accounts

  get 'activity/mine'
  get 'activity/feed'

  root to: 'activity#mine'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
