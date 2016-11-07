class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.references :activity, foreign_key: true
      t.integer :time_elapsed
      t.integer :calories_burned
      t.float :distance
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
