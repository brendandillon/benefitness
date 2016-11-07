class User < ApplicationRecord
  belongs_to :team
  has_many :workouts

  has_secure_password
  enum role: [ :user, :admin ]

  def full_name
    "#{first_name} #{last_name}"
  end

  def last_workout
    # once we have dates on workouts, change this from created_at
    if workouts.empty?
      return nil
    end
    last = workouts.last
    "#{last.distance} mile #{last.activity.name}"
  end
end
