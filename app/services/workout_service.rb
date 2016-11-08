class WorkoutService
  def self.import(workouts, day, user)
    workouts.each do |raw_workout|
      Workout.where(fitbit_id: raw_workout[:activityId])
             .first_or_create(
               user: user,
               activity: Activity.find_by_name(raw_workout[:name]),
               date: day,
               calories_burned: raw_workout[:calories].to_i,
               distance: raw_workout[:distance].to_f,
               time_elapsed: raw_workout[:duration].to_i / 60000
             )
    end
  end
end
