class WorkoutExercisesController < ApplicationController

  def index
    @workout = current_user.workouts.find(params[:workout_id])
  end

end