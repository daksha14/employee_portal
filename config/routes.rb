Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  get '/', to: "user#index"
  get '/admin/user', to: "admin/users#index"

  resources :admin,only: :index

  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
