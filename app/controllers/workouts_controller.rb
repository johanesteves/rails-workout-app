class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :edit, :update, :destroy, :exercises]

  def index
    @workouts = current_user.workouts.sorted_by_date
    @workout = Workout.new
  end

  def new
    @workout = Workout.new
  end

  def show
    @exercise = Exercise.new
  end

  def current_week
    @workouts = current_user.workouts.current_week.sorted_by_date
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      flash[:success] = 'Workout created successfully.'
    else
      flash[:danger] = @workout.errors.full_messages.join('. ')
    end
    redirect_to workouts_path
  end

  def edit; end

  def update
    if @workout.update(workout_params)
      flash[:success] = 'Workout updated successfully.'
      redirect_to workout_path(@workout)
    else
      render :edit
    end
  end

  def destroy
    if @workout.destroy
      flash[:success] = 'Workout deleted successfully.'
      redirect_to workouts_path
    else
      render :show
    end
  end

  def exercises; end

  private

  def workout_params
    params.require(:workout).permit(:name, :date, exercise_ids: [], exercises_attributes: [:name, :bodypart])
  end

  def set_workout
    @workout = current_user.workouts.find_by(id: params[:id])
  end
end
