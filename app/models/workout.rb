class Workout < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  has_many :likes

  def format_time
    formatted = ""
    if time_elapsed <= 60
      formatted = "#{time_elapsed / 60} hours "
    end
    formatted += "#{time_elapsed % 60} minutes"
  end

  def number_of_likes
    "#{likes.count} likes" unless likes.count == 0
  end
end
