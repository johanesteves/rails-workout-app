class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts

  def exercises_attributes=(exercise_attributes)
    exercise_attributes.each_value do |exercise_attribute|
      if !exercise_attribute.values.any? {|i| i.empty?}
        self.exercises.build(exercise_attribute)
      end
    end
  end

end
