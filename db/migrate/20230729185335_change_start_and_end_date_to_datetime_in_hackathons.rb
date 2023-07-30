class ChangeStartAndEndDateToDatetimeInHackathons < ActiveRecord::Migration[7.0]
  def change
    change_column :hackathons, :start_date, :datetime
    change_column :hackathons, :end_date, :datetime
  end
end
