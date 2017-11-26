Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'application#index'


  resources :workouts
  get 'workouts/:id/exercises', to: 'workouts#exercises', as: 'workout_exercises'

  resources :exercises
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
