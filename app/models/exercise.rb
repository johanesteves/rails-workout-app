class Exercise < ApplicationRecord
  has_many :exercise_workouts
  has_many :workouts, through: :exercise_workouts

  def self.filter_bodypart(bodypart)
    if bodypart.blank?
      order('name ASC')
    else
      where(bodypart: bodypart).order('name ASC')
    end
  end
end
