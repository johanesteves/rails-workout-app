class WorkoutsController < ApplicationController

  before_action :user_is_current_user, only: [:create]

  def index
    @workouts = current_user.workouts
    @workout = current_user.workouts.build
  end

  def show
    @workout = current_user.workouts.find(params[:id])
    @exercises = @workout.exercises
  end

  def create
      @workout = Workout.new(workout_params)
      if @workout.save
        redirect_to workout_path(@workout)
      else
        render :index
      end
    else
  end

  def edit
    @workout = Workout.find_by(user_id: params[:user_id], id: params[:id])
  end

  def update
    @workout = Workout.find_by(user_id: params[:user_id], id: params[:id])
    if @workout.update(workout_params)
      redirect_to user_workout_path(@workout.user, @workout)
    else
      render :edit
    end
  end


  private
  def workout_params
    params.require(:workout).permit(:name, :date, :user_id)
  end
end