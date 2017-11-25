Rails.application.routes.draw do
  devise_for :users

  root 'application#index'


  resources :workouts do
    resources :exercises, :controller=>"workout_exercises"
  end
  resources :exercises
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
