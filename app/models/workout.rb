class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts

  def exercises_attributes=(exercise_attributes)
    exercise_attributes.each_value do |exercise_params|
      exercises << Exercise.where(exercise_params).first_or_create unless exercise_params.values.any? {|i| i.empty? }
    end
  end

end
