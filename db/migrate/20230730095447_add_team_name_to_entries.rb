class AddTeamNameToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :team_name, :string
  end
end
