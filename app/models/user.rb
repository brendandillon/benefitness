class User < ApplicationRecord
  belongs_to :team
  has_secure_password
  enum role: [ :user, :admin ]
end
