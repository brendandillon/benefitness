class Team::WorkoutsController < ApplicationController
  def index
    @workouts = Workout.joins(:user).where('users.team_id = ?', current_user.team.id)
  end
end
