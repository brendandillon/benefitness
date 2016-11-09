class Like < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  validates :user, uniqueness: {scope: :workout}
end
