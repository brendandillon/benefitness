class AddFitbitAccessTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fitbit_access_token, :string
    add_column :users, :fitbit_refresh_token, :string
  end
end
