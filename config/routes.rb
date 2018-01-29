Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, skip: [:sessions],controllers: { registrations: 'users/registrations' }
  devise_scope :user do
   get 'login', to: 'users/sessions#new',as: :new_user_session
   post 'login', to: 'users/sessions#create', as: :user_session
   delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  end
  devise_scope :user do
    
  end
  root "main#index"
  get "/offer" => "main#offer"
  get "/cabinet" => "users#show"
  resources :soc_user_links
  resources :invited_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
