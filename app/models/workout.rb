class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts

  validates :name, uniqueness: true, presence: true
  validate :date_cannot_be_in_the_future

  scope :current_week, -> {where('date BETWEEN ? AND ?', Date.today.at_beginning_of_week, Date.today.at_end_of_week)}

  def exercises_attributes=(exercise_attributes)
    exercise_attributes.each_value do |exercise_params|
      unless exercise_params.values.any? {|i| i.empty? } || exercise_params[:name]
        new_exer_workout = ExerciseWorkout.find_or_create_by(exercise_id: exercise_params[:exercise_id ], workout: self)
        new_exer_workout.reps = exercise_params[:reps]
        exercise_workouts << new_exer_workout
        binding.pry
      end

      unless exercise_params.values.any? {|i| i.empty? } || Exercise.body_parts.exclude?(exercise_params[:bodypart])
        exercises << Exercise.find_or_create_by(exercise_params)
      end
    end
  end

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end

  def self.sorted_by_date
    all.group_by {|workout| workout.date}.sort.reverse!
  end

end
