class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :workouts
  validate :birthday_cannot_be_in_the_future
  validates :weight, numericality: { greater_than_or_equal_to: 50 }


  def birthday_cannot_be_in_the_future
    errors.add(:birthday, "can't be in the future") if
        !birthday.blank? && birthday > Date.today
  end

end
