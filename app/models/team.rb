class Team < ApplicationRecord
  before_create :generate_code

  def generate_code
    self.code = '%05d' % rand( 10**5 )
  end
end
