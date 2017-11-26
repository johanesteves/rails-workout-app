class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts

  validates :name, uniqueness: true, presence: true
  validate :date_cannot_be_in_the_future

  def exercises_attributes=(exercise_attributes)
    exercise_attributes.each_value do |exercise_params|
      exercises << Exercise.where(exercise_params).first_or_create unless exercise_params.values.any? {|i| i.empty? }
    end
  end

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, "can't be in the future")
    end
  end

  # def self.current_week(workouts)
  #   workouts.where("date BETWEEN ? AND ?", Date.today.at_beginning_of_week, Date.today.at_end_of_week)
  # end
end
