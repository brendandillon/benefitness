class User < ApplicationRecord
  belongs_to :team
  has_many :workouts

  has_secure_password
  enum role: [ :user, :admin ]

  def full_name
    "#{first_name} #{last_name}"
  end
end
