class AddFitbitIdToWorkout < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :fitbit_id, :string
  end
end
