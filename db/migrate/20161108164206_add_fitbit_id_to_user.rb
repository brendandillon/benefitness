class AddFitbitIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fitbit_id, :string
  end
end
