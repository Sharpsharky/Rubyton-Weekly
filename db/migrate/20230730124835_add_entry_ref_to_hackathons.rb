class AddEntryRefToHackathons < ActiveRecord::Migration[7.0]
  def change
    add_reference :hackathons, :entry, null: false, foreign_key: true
  end
end
