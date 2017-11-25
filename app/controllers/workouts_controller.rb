class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = current_user.workouts
    @workout = Workout.new
  end

  def show
    @exercise = Exercise.new
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    @workout.save
    redirect_to workouts_path
  end

  def edit; end

  def update
    if @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      render :edit
    end
  end

  def destroy
    if @workout.destroy
      redirect_to workouts_path
    else
      render :show
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :date, exercise_ids: [], exercises_attributes: [:name, :bodypart])
  end

  def set_workout
    @workout = current_user.workouts.find_by(id: params[:id])
  end
end