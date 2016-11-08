class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      render :new
    end
  end

  def index
    @workouts = current_user.workouts.where('date > ?', Date.today - 7)
  end

  private
    def workout_params
      params.require(:workout)
            .permit(:activity_id, :distance, :calories_burned, :date)
            .merge(time_elapsed: minutes_elapsed)
            .merge(user_id: current_user.id)
    end

    def minutes_elapsed
      time = params[:workout][:time_elapsed]
      time[:hours].to_i * 60 +
      time[:minutes].to_i
    end
end
