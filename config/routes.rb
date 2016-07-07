Rails.application.routes.draw do
  get "user/profile"=>"users#profile"
  get "user/contacts"=>"users#contacts"
  devise_for :users, controllers: { :omniauth_callbacks => "session" }
  root 'home#index'
end
