class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.where(user_id: params[:user_id])
  end

end