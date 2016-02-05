Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  root to: 'application#me'

  get '/me' => 'application#me'
end
