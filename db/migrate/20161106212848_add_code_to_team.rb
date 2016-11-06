class AddCodeToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :code, :string
  end
end
