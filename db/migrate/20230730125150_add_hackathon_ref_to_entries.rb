class AddHackathonRefToEntries < ActiveRecord::Migration[7.0]
  def change
    add_reference :entries, :hackathon, null: false, foreign_key: true
  end
end
