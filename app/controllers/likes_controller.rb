class LikesController < ApplicationController
  def create
    workout = Workout.find_by_id(params[:workout_id])
    Like.create(user: current_user, workout: workout)
    redirect_to team_workouts_path
  end
end
