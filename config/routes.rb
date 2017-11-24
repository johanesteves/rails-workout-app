Rails.application.routes.draw do
  devise_for :users

  root 'application#index'

  # resources :users, only: [] do
  # end

  resources :workouts
  resources :exercises
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
