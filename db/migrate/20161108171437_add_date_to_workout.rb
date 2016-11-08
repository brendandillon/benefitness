class AddDateToWorkout < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :date, :date
  end
end
