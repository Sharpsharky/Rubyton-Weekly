class RemoveEntryRefFromHackathons < ActiveRecord::Migration[7.0]
  def change
    remove_reference :hackathons, :entry, null: false, foreign_key: true
  end
end
