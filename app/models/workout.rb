class Workout < ApplicationRecord
  belongs_to :User
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts
end
