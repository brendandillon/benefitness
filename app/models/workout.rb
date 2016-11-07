class Workout < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  def format_time
    formatted = ""
    if time_elapsed <= 60
      formatted = "#{time_elapsed / 60} hours "
    end
    formatted += "#{time_elapsed % 60} minutes"
  end
end
