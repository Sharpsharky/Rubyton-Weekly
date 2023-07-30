class CreateHackathons < ActiveRecord::Migration[7.0]
  def change
    create_table :hackathons do |t|
      t.string :title
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
